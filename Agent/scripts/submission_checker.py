#!/usr/bin/env python3
"""
SQL 스터디 제출 현황 확인 스크립트
매주 금요일 자정에 실행되어 참여자들의 제출 현황을 확인합니다.
"""

import os
import json
import glob
import logging
from datetime import datetime, timedelta
from pathlib import Path
from typing import Dict, List, Any

# 로깅 설정
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('submission_check.log'),
        logging.StreamHandler()
    ]
)

SCRIPT_DIR = Path(__file__).resolve().parent           # Agent/scripts
AGENT_DIR = SCRIPT_DIR.parent                          # Agent
REPO_ROOT = AGENT_DIR.parent                           # repo root
CONFIG_PARTICIPANTS = AGENT_DIR / "config" / "participants.json"
CONFIG_SEASONS = AGENT_DIR / "config" / "seasons.json"
RESULTS_DIR = AGENT_DIR / "results"
ARCHIVE_DIR = REPO_ROOT / "Archive"

class SubmissionChecker:
    def __init__(self, config_path: Path = CONFIG_PARTICIPANTS):
        """제출 현황 확인기 초기화"""
        self.config_path = Path(config_path)
        self.load_config()
        
    def load_config(self):
        """설정 파일 로드"""
        try:
            with open(self.config_path, 'r', encoding='utf-8') as f:
                self.config = json.load(f)
            logging.info(f"설정 파일 로드 완료: {self.config_path}")
        except FileNotFoundError:
            logging.error(f"설정 파일을 찾을 수 없습니다: {self.config_path}")
            raise
        except json.JSONDecodeError as e:
            logging.error(f"설정 파일 JSON 파싱 오류: {e}")
            raise
    
    def check_submissions(self, season: int, week: int) -> Dict[str, Any]:
        """특정 시즌/주차의 제출 현황 확인

        로직 개요 (현재 주차 관점):
        - 현재 주차에서 필수 개수 이상이면 ✅
        - 현재 주차에서 미달이면:
          - 시즌의 마지막 주차인 경우 ❌
          - 마지막 주차가 아니라면 '-' (다음 주에 지각 여부 확정)
        지각(⏰) 여부 판정은 이전 주차 전용 함수(check_previous_week_submissions)에서 수행합니다.
        """
        logging.info(f"Season {season} Week {week} 제출 현황 확인 시작")
        
        results = {}
        base_path = ARCHIVE_DIR / f"Season_{season}" / f"Week_{week}"
        
        # 시즌 설정에서 총 주차 수 로드 (마지막 주차 판정용)
        try:
            with open(CONFIG_SEASONS, 'r', encoding='utf-8') as f:
                seasons_config = json.load(f)
            total_weeks = seasons_config['seasons'][str(season)]['weeks']
        except Exception as e:
            logging.warning(f"시즌 설정 로드 실패 또는 존재하지 않음: {e}. 마지막 주차로 간주합니다.")
            total_weeks = week
        
        # 디렉토리 존재 확인
        if not base_path.exists():
            logging.warning(f"디렉토리가 존재하지 않습니다: {base_path}")
            return results
        
        for participant in self.config['participants']:
            # 활성 참가자만 처리
            if not participant.get('active', True):  # active가 없으면 기본값 True
                continue
                
            name = participant['name']
            prefix = participant['file_prefix']
            required = participant['required_problems']
            
            # 현재 주차 파일 패턴 매칭
            pattern = str(base_path / f"{prefix}_problem_*.sql")
            files = glob.glob(pattern)
            
            # 제출 현황 판단 (현재 주차 기준)
            if len(files) >= required:
                status = "✅"  # 제출 완료
                logging.info(f"{name}: 제출 완료 ({len(files)}/{required})")
            else:
                if week >= total_weeks:
                    status = "❌"  # 마지막 주차에서는 즉시 미제출 확정
                    logging.error(f"{name}: 마지막 주차 미제출 확정 ({len(files)}/{required})")
                else:
                    status = "-"   # 다음 주에 지각 여부 확정
                    logging.info(f"{name}: 현재 주차 미달, 다음 주에 지각 여부 확정 예정 ({len(files)}/{required})")
                
            results[name] = {
                'status': status,
                'submitted': len(files),
                'required': required,
                'files': files,
                'file_prefix': prefix
            }
            
        logging.info(f"제출 현황 확인 완료: {len(results)}명")
        return results
    
    def check_previous_week_submissions(self, season: int, week: int) -> Dict[str, Any]:
        """이전 주차의 제출 현황 확인 (지각 제출 판단용)

        규칙:
        - 이전 주차가 당시에 완료(✅)였는지 저장된 결과 JSON으로 판단
        - 이전 주차가 당시에 미완(예: '-')이었다면, 이번 주 시점에 지각 또는 미제출 확정
        - 저장된 결과 파일이 없다면 보수적으로 당시에 미완으로 간주하여 위 규칙 적용
        """
        if week <= 1:
            return {}
            
        logging.info(f"Season {season} Week {week-1} 이전 주차 제출 현황 확인 시작")
        
        results = {}
        prev_path = ARCHIVE_DIR / f"Season_{season}" / f"Week_{week-1}"
        # 이전 주차 저장 결과 로드 시도
        previous_results_file = RESULTS_DIR / f"season_{season}_week_{week-1}_results.json"
        previous_saved_status: Dict[str, Any] = {}
        try:
            if previous_results_file.exists():
                with open(previous_results_file, 'r', encoding='utf-8') as f:
                    previous_saved = json.load(f)
                    previous_saved_status = previous_saved.get('results', {})
                    logging.info(f"이전 주차 저장 결과 로드 완료: {previous_results_file}")
            else:
                logging.warning(f"이전 주차 저장 결과 파일이 없습니다: {previous_results_file}")
        except Exception as e:
            logging.warning(f"이전 주차 저장 결과 로드 실패: {e}")
        
        # 디렉토리 존재 확인
        if not prev_path.exists():
            logging.warning(f"이전 주차 디렉토리가 존재하지 않습니다: {prev_path}")
            return results
        
        for participant in self.config['participants']:
            # 활성 참가자만 처리
            if not participant.get('active', True):  # active가 없으면 기본값 True
                continue
                
            name = participant['name']
            prefix = participant['file_prefix']
            required = participant['required_problems']
            
            # 이전 주차 파일 패턴 매칭 (현재 시점 파일 수)
            pattern = str(prev_path / f"{prefix}_problem_*.sql")
            files = glob.glob(pattern)
            
            # 이전 주차 당시에 완료였는지 저장된 결과 확인
            prev_saved = previous_saved_status.get(name)
            was_on_time_complete = prev_saved and prev_saved.get('status') == '✅'

            if was_on_time_complete:
                status = '✅'
                logging.info(f"{name}: 이전 주차 당시에 이미 완료로 기록됨 (✅ 유지)")
            else:
                # 당시에 미완이었다고 가정하고 현재 시점으로 확정
                # '지각 보완'은 이전 주차 폴더 자체가 필수 개수 이상으로 채워졌을 때만 인정
                if len(files) >= required:
                    status = '⏰'  # 지각 보완
                    logging.warning(f"{name}: 이전 주차 지각 보완 확정 (⏰)")
                else:
                    status = '❌'  # 미제출 확정
                    logging.error(f"{name}: 이전 주차 미제출 확정 (❌)")
                
            results[name] = {
                'status': status,
                'submitted': len(files),
                'required': required,
                'files': files,
                'file_prefix': prefix
            }
            
        logging.info(f"이전 주차 제출 현황 확인 완료: {len(results)}명")
        return results
    
    def get_current_week_info(self) -> tuple:
        """현재 시즌과 주차 정보 반환"""
        return self.config['current_season'], self.config['current_week']
    
    def check_all_weeks(self, season: int) -> Dict[int, Dict[str, Any]]:
        """특정 시즌의 모든 주차 제출 현황 확인"""
        all_results = {}
        
        # 시즌 설정 로드
        with open(CONFIG_SEASONS, 'r', encoding='utf-8') as f:
            seasons_config = json.load(f)
        
        if str(season) not in seasons_config['seasons']:
            logging.error(f"Season {season} 설정을 찾을 수 없습니다")
            return all_results
        
        total_weeks = seasons_config['seasons'][str(season)]['weeks']
        
        for week in range(1, total_weeks + 1):
            week_results = self.check_submissions(season, week)
            if week_results:  # 결과가 있는 경우만 추가
                all_results[week] = week_results
        
        return all_results

def main():
    """메인 실행 함수"""
    try:
        checker = SubmissionChecker()
        current_season, current_week = checker.get_current_week_info()
        
        # 현재 주차 제출 현황 확인
        results = checker.check_submissions(current_season, current_week)
        
        # 결과를 JSON 파일로 저장 (다른 스크립트에서 사용)
        output_file = RESULTS_DIR / f"season_{current_season}_week_{current_week}_results.json"
        RESULTS_DIR.mkdir(parents=True, exist_ok=True)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump({
                'season': current_season,
                'week': current_week,
                'check_time': datetime.now().isoformat(),
                'results': results
            }, f, ensure_ascii=False, indent=2)
        
        logging.info(f"결과 저장 완료: {output_file}")
        
        # 콘솔 출력
        print(f"\n=== Season {current_season} Week {current_week} 제출 현황 ===")
        for name, data in results.items():
            print(f"{name}: {data['status']} ({data['submitted']}/{data['required']})")
        
    except Exception as e:
        logging.error(f"실행 중 오류 발생: {e}")
        raise

if __name__ == "__main__":
    main() 