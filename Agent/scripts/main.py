#!/usr/bin/env python3
"""
SQL 스터디 자동화 메인 스크립트
제출 현황 확인, README 업데이트, 디스코드 알림을 순차적으로 실행합니다.
"""

import os
import sys
import logging
import json
import pytz
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
    """금요일 자정 후인지 확인하여 주차 증가 여부 결정
    
    GitHub Actions는 UTC 시간으로 실행되므로 한국 시간대를 고려해야 함
    - cron '0 15 * * 5' = 한국 시간 토요일 00:00 (금요일 자정)
    
    허용되는 시간대:
    1. 금요일 12:00 ~ 23:59 (금요일 오후~밤)
    2. 토요일 00:00 ~ 06:00 (금요일 자정 직후, GitHub Actions 실행 시점)
    
    추가 보호 장치:
    - 중복 실행 방지: 이미 이번 주차가 증가했는지 확인
    """
    # 한국 시간대로 현재 시간 가져오기
    kst = pytz.timezone('Asia/Seoul')
    now_kst = datetime.now(kst)
    
    # 금요일 오후~밤 (12:00 ~ 23:59)
    if now_kst.weekday() == 4 and now_kst.hour >= 12:  # 금요일 오후
        return not _already_incremented_today()
    
    # 토요일 새벽 (00:00 ~ 06:00) - 금요일 자정 직후
    elif now_kst.weekday() == 5 and now_kst.hour <= 6:  # 토요일 새벽
        return not _already_incremented_today()
    
    return False

def _already_incremented_today() -> bool:
    """오늘 이미 주차가 증가했는지 확인
    
    간단하게 현재 시간과 마지막 실행 시간을 비교
    """
    try:
        # 임시 파일로 마지막 실행 시간 기록
        last_run_file = AGENT_DIR / ".last_week_increment"
        
        if last_run_file.exists():
            with open(last_run_file, 'r') as f:
                last_run_date = f.read().strip()
            
            today = datetime.now().date().strftime('%Y-%m-%d')
            if last_run_date == today:
                logging.info("오늘 이미 주차가 증가했습니다. 중복 실행을 방지합니다.")
                return True
        
        return False
    except Exception as e:
        logging.warning(f"중복 실행 확인 중 오류: {e}. 안전하게 진행합니다.")
        return False

def update_week_in_config(config_path: Path, current_week: int) -> bool:
    """설정 파일에서 current_week를 증가시키고 저장
    
    시즌 종료 시 다음 시즌으로 자동 전환 로직 포함
    """
    try:
        # 설정 파일 읽기
        with open(config_path, 'r', encoding='utf-8') as f:
            config = json.load(f)
        
        current_season = config['current_season']
        
        # 시즌 설정 로드하여 총 주차 수 확인
        seasons_config_path = AGENT_DIR / "config" / "seasons.json"
        try:
            with open(seasons_config_path, 'r', encoding='utf-8') as f:
                seasons_config = json.load(f)
            total_weeks = seasons_config['seasons'][str(current_season)]['weeks']
        except Exception as e:
            logging.warning(f"시즌 설정 로드 실패: {e}. 기본값 9주로 설정")
            total_weeks = 9
        
        # 시즌 종료 확인
        if current_week >= total_weeks:
            # 다음 시즌으로 전환
            next_season = current_season + 1
            
            # 다음 시즌 설정이 있는지 확인
            if str(next_season) in seasons_config.get('seasons', {}):
                config['current_season'] = next_season
                config['current_week'] = 1
                logging.info(f"시즌 종료! 시즌 {current_season} → 시즌 {next_season}, 주차: 1")
            else:
                # 다음 시즌 설정이 없으면 현재 시즌 유지
                logging.warning(f"시즌 {next_season} 설정이 없습니다. 현재 시즌 {current_season} 유지")
                return False
        else:
            # 일반적인 주차 증가
            new_week = current_week + 1
            config['current_week'] = new_week
            logging.info(f"주차 자동 증가: {current_week} → {new_week}")
        
        # 설정 파일 저장
        with open(config_path, 'w', encoding='utf-8') as f:
            json.dump(config, f, ensure_ascii=False, indent=2)
        
        # 실행 시간 기록 (중복 실행 방지용)
        last_run_file = AGENT_DIR / ".last_week_increment"
        with open(last_run_file, 'w') as f:
            f.write(datetime.now().date().strftime('%Y-%m-%d'))
        
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

        # 현재 주차 결과 저장 (README, Discord 등 외부에서도 참고 가능하도록)
        try:
            current_output_file = RESULTS_DIR / f"season_{current_season}_week_{current_week}_results.json"
            RESULTS_DIR.mkdir(parents=True, exist_ok=True)
            with open(current_output_file, 'w', encoding='utf-8') as f:
                json.dump({
                    'season': current_season,
                    'week': current_week,
                    'check_time': datetime.now().isoformat(),
                    'results': current_results
                }, f, ensure_ascii=False, indent=2)
            logging.info(f"현재 주차 결과 저장 완료: {current_output_file}")
        except Exception as e:
            logging.warning(f"현재 주차 결과 저장 실패: {e}")
        
        # 3. 이전 주차 제출 현황 확인 (지각 제출 판단용)
        if current_week > 1:
            logging.info("이전 주차 제출 현황 확인 시작")
            previous_results = checker.check_previous_week_submissions(current_season, current_week)
            logging.info(f"이전 주차 제출 현황 확인 완료: {len(previous_results)}명")
            # 이전 주차 결과 저장 (지각/미제출 확정 반영)
            try:
                prev_output_file = RESULTS_DIR / f"season_{current_season}_week_{current_week-1}_results.json"
                RESULTS_DIR.mkdir(parents=True, exist_ok=True)
                with open(prev_output_file, 'w', encoding='utf-8') as f:
                    json.dump({
                        'season': current_season,
                        'week': current_week - 1,
                        'check_time': datetime.now().isoformat(),
                        'results': previous_results
                    }, f, ensure_ascii=False, indent=2)
                logging.info(f"이전 주차 결과 저장 완료: {prev_output_file}")
            except Exception as e:
                logging.warning(f"이전 주차 결과 저장 실패: {e}")
        else:
            previous_results = {}
        
        # 4. README 업데이트 (이전 주차 → 현재 주차 순서)
        logging.info("2단계: README 업데이트 시작")
        updater = ReadmeUpdater()
        prev_update_success = True
        if current_week > 1 and previous_results:
            logging.info("README 이전 주차 상태 업데이트")
            prev_update_success = updater.update_status_table(current_season, current_week - 1, previous_results)
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
        print(f"📝 README 업데이트(이전 주차): {'성공' if prev_update_success else '스킵/실패'}")
        print(f"📝 README 업데이트(현재 주차): {'성공' if readme_success else '실패'}")
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