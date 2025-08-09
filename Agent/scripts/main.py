#!/usr/bin/env python3
"""
SQL 스터디 자동화 메인 스크립트
제출 현황 확인, README 업데이트, 디스코드 알림을 순차적으로 실행합니다.
"""

import os
import sys
import logging
import json
from datetime import datetime, timedelta
from pathlib import Path

# 스크립트 디렉토리를 Python 경로에 추가
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from submission_checker import SubmissionChecker
from readme_updater import ReadmeUpdater
from discord_notifier import DiscordNotifier

# 경로 상수 설정
SCRIPT_DIR = Path(__file__).resolve().parent           # Agent/scripts
AGENT_DIR = SCRIPT_DIR.parent                          # Agent
REPO_ROOT = AGENT_DIR.parent                           # repo root
CONFIG_PARTICIPANTS = AGENT_DIR / "config" / "participants.json"
RESULTS_DIR = AGENT_DIR / "results"

def should_increment_week() -> bool:
    """금요일 자정 후인지 확인하여 주차 증가 여부 결정"""
    now = datetime.now()
    
    # 금요일인지 확인 (월요일=0, 금요일=4)
    if now.weekday() != 4:  # 금요일이 아니면 False
        return False
    
    # 자정 이후인지 확인 (00:00 ~ 06:00 사이)
    if now.hour < 6:  # 자정 후 6시간 이내
        return True
    
    return False

def update_week_in_config(config_path: Path, current_week: int) -> bool:
    """설정 파일에서 current_week를 증가시키고 저장"""
    try:
        # 설정 파일 읽기
        with open(config_path, 'r', encoding='utf-8') as f:
            config = json.load(f)
        
        # 주차 증가
        new_week = current_week + 1
        config['current_week'] = new_week
        
        # 설정 파일 저장
        with open(config_path, 'w', encoding='utf-8') as f:
            json.dump(config, f, ensure_ascii=False, indent=2)
        
        logging.info(f"주차 자동 증가: {current_week} → {new_week}")
        return True
        
    except Exception as e:
        logging.error(f"주차 증가 중 오류 발생: {e}")
        return False

# 로깅 설정
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('automation.log'),
        logging.StreamHandler()
    ]
)

def main():
    """메인 실행 함수"""
    start_time = datetime.now()
    logging.info("=== SQL 스터디 자동화 시작 ===")
    
    try:
        # 1. 설정 파일 로드
        with open(CONFIG_PARTICIPANTS, 'r', encoding='utf-8') as f:
            config = json.load(f)
        
        current_season = config['current_season']
        current_week = config['current_week']
        
        logging.info(f"현재 시즌: {current_season}, 주차: {current_week}")
        
        # 주차 자동 증가 확인
        if should_increment_week():
            logging.info("금요일 자정 후 감지 - 주차 자동 증가 시작")
            if update_week_in_config(CONFIG_PARTICIPANTS, current_week):
                current_week += 1
                logging.info(f"주차 증가 완료: {current_week}")
            else:
                logging.warning("주차 증가 실패 - 기존 주차로 진행")
        else:
            logging.info("주차 자동 증가 조건 미충족 - 기존 주차 유지")
        
        # 2. 제출 현황 확인 (현재 주차)
        logging.info("1단계: 제출 현황 확인 시작")
        checker = SubmissionChecker()
        current_results = checker.check_submissions(current_season, current_week)
        
        if not current_results:
            logging.error("현재 주차 제출 현황 확인 실패")
            return False
        
        logging.info(f"현재 주차 제출 현황 확인 완료: {len(current_results)}명")
        
        # 3. 이전 주차 제출 현황 확인 (지각 제출 판단용)
        if current_week > 1:
            logging.info("이전 주차 제출 현황 확인 시작")
            previous_results = checker.check_previous_week_submissions(current_season, current_week)
            logging.info(f"이전 주차 제출 현황 확인 완료: {len(previous_results)}명")
        else:
            previous_results = {}
        
        # 4. README 업데이트 (현재 주차)
        logging.info("2단계: README 업데이트 시작")
        updater = ReadmeUpdater()
        readme_success = updater.update_status_table(current_season, current_week, current_results)
        
        if readme_success:
            logging.info("README 업데이트 완료")
        else:
            logging.error("README 업데이트 실패")
            return False
        
        # 5. 디스코드 알림 전송
        logging.info("3단계: 디스코드 알림 전송 시작")
        notifier = DiscordNotifier()
        discord_success = notifier.send_notification(current_season, current_week, current_results)
        
        if discord_success:
            logging.info("디스코드 알림 전송 완료")
        else:
            logging.warning("디스코드 알림 전송 실패 (웹훅 URL이 설정되지 않았을 수 있음)")
        
        # 6. 결과 요약
        end_time = datetime.now()
        duration = end_time - start_time
        
        completed = [name for name, data in current_results.items() if data['status'] == '✅']
        late = [name for name, data in current_results.items() if data['status'] == '⏰']
        missing = [name for name, data in current_results.items() if data['status'] == '❌']
        
        print(f"\n=== 자동화 완료 ===")
        print(f"⏱️  소요 시간: {duration.total_seconds():.2f}초")
        print(f"📊 제출 현황:")
        print(f"   ✅ 완료: {len(completed)}명 ({', '.join(completed) if completed else '없음'})")
        print(f"   ⏰ 지각: {len(late)}명 ({', '.join(late) if late else '없음'})")
        print(f"   ❌ 미제출: {len(missing)}명 ({', '.join(missing) if missing else '없음'})")
        print(f"📝 README 업데이트: {'성공' if readme_success else '실패'}")
        print(f"📢 디스코드 알림: {'성공' if discord_success else '실패'}")
        
        logging.info("=== SQL 스터디 자동화 완료 ===")
        return True
        
    except Exception as e:
        logging.error(f"자동화 실행 중 오류 발생: {e}")
        return False

def test_individual_components():
    """개별 컴포넌트 테스트"""
    print("=== 개별 컴포넌트 테스트 ===")
    
    try:
        # 설정 파일 테스트
        with open(CONFIG_PARTICIPANTS, 'r', encoding='utf-8') as f:
            config = json.load(f)
        print("✅ 설정 파일 로드 성공")
        
        # 제출 확인기 테스트
        checker = SubmissionChecker()
        current_season, current_week = checker.get_current_week_info()
        print(f"✅ 제출 확인기 초기화 성공 (Season {current_season}, Week {current_week})")
        
        # README 업데이터 테스트
        updater = ReadmeUpdater()
        print("✅ README 업데이터 초기화 성공")
        
        # 디스코드 알림기 테스트
        notifier = DiscordNotifier()
        print("✅ 디스코드 알림기 초기화 성공")
        
        print("✅ 모든 컴포넌트 테스트 통과")
        return True
        
    except Exception as e:
        print(f"❌ 컴포넌트 테스트 실패: {e}")
        return False

if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="SQL 스터디 자동화 스크립트")
    parser.add_argument("--test", action="store_true", help="개별 컴포넌트 테스트 실행")
    
    args = parser.parse_args()
    
    if args.test:
        test_individual_components()
    else:
        main() 