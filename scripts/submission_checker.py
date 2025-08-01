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

class SubmissionChecker:
    def __init__(self, config_path: str = "config/participants.json"):
        """제출 현황 확인기 초기화"""
        self.config_path = config_path
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
        """특정 시즌/주차의 제출 현황 확인"""
        logging.info(f"Season {season} Week {week} 제출 현황 확인 시작")
        
        results = {}
        base_path = f"Archive/Season_{season}/Week_{week}"
        
        # 디렉토리 존재 확인
        if not os.path.exists(base_path):
            logging.warning(f"디렉토리가 존재하지 않습니다: {base_path}")
            return results
        
        for participant in self.config['participants']:
            name = participant['name']
            prefix = participant['file_prefix']
            required = participant['required_problems']
            
            # 현재 주차 파일 패턴 매칭
            pattern = f"{base_path}/{prefix}_problem_*.sql"
            files = glob.glob(pattern)
            
            # 제출 현황 판단
            if len(files) >= required:
                status = "✅"  # 제출 완료
                logging.info(f"{name}: 제출 완료 ({len(files)}/{required})")
            else:
                # 이번 주에 제출하지 않은 경우, 차주 제출 현황 확인
                next_week_path = f"Archive/Season_{season}/Week_{week+1}"
                next_pattern = f"{next_week_path}/{prefix}_problem_*.sql"
                next_files = glob.glob(next_pattern)
                
                if len(next_files) >= required:
                    status = "⏰"  # 지각 제출 (차주에 제출)
                    logging.warning(f"{name}: 지각 제출 (차주에 제출)")
                else:
                    status = "❌"  # 미제출 (차주에도 미제출)
                    logging.error(f"{name}: 미제출 (차주에도 미제출)")
                
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
        """이전 주차의 제출 현황 확인 (지각 제출 판단용)"""
        if week <= 1:
            return {}
            
        logging.info(f"Season {season} Week {week-1} 이전 주차 제출 현황 확인 시작")
        
        results = {}
        prev_path = f"Archive/Season_{season}/Week_{week-1}"
        
        # 디렉토리 존재 확인
        if not os.path.exists(prev_path):
            logging.warning(f"이전 주차 디렉토리가 존재하지 않습니다: {prev_path}")
            return results
        
        for participant in self.config['participants']:
            name = participant['name']
            prefix = participant['file_prefix']
            required = participant['required_problems']
            
            # 이전 주차 파일 패턴 매칭
            pattern = f"{prev_path}/{prefix}_problem_*.sql"
            files = glob.glob(pattern)
            
            # 이번 주차 파일 패턴 매칭 (지각 제출 확인용)
            current_path = f"Archive/Season_{season}/Week_{week}"
            current_pattern = f"{current_path}/{prefix}_problem_*.sql"
            current_files = glob.glob(current_pattern)
            
            # 이전 주차 제출 현황 판단
            if len(files) >= required:
                status = "✅"  # 이전 주차 제출 완료
                logging.info(f"{name}: 이전 주차 제출 완료 ({len(files)}/{required})")
            else:
                # 이전 주차에 제출하지 않았지만, 이번 주차에 제출했다면 지각
                if len(current_files) >= required:
                    status = "⏰"  # 지각 제출 (이번 주차에 제출)
                    logging.warning(f"{name}: 이전 주차 지각 제출 (이번 주차에 제출)")
                else:
                    status = "❌"  # 미제출
                    logging.error(f"{name}: 이전 주차 미제출")
                
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
        with open("config/seasons.json", 'r', encoding='utf-8') as f:
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
        output_file = f"results/season_{current_season}_week_{current_week}_results.json"
        os.makedirs("results", exist_ok=True)
        
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