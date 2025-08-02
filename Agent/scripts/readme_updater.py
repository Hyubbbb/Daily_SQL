#!/usr/bin/env python3
"""
README 업데이트 스크립트
제출 현황 확인 결과를 바탕으로 README.md 파일의 표를 업데이트합니다.
"""

import re
import json
import logging
from pathlib import Path
from typing import Dict, Any, List

# 로깅 설정
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

class ReadmeUpdater:
    def __init__(self, readme_path: str = "README.md"):
        self.readme_path = readme_path
        
    def load_results(self, season: int, week: int) -> Dict[str, Any]:
        """결과 파일 로드"""
        results_file = f"results/season_{season}_week_{week}_results.json"
        try:
            with open(results_file, 'r', encoding='utf-8') as f:
                return json.load(f)
        except FileNotFoundError:
            logging.error(f"결과 파일을 찾을 수 없습니다: {results_file}")
            return {}
    
    def find_current_table(self, content: str) -> tuple:
        """현재 시즌의 최상단 표 찾기"""
        # 현재 시즌 표 패턴 (Week/Member 헤더가 있는 표) - 공백 없이
        table_pattern = r'(\|Week/Member\|.*?\n)((?:\|.*?\n)*)'
        match = re.search(table_pattern, content)
        
        if match:
            return match.group(1), match.group(2), match.start(), match.end()
        return None, None, -1, -1
    
    def update_table_rows(self, table_body: str, week: int, results: Dict[str, Any]) -> str:
        """테이블 행 업데이트"""
        lines = table_body.strip().split('\n')
        updated_lines = []
        
        for line in lines:
            if line.strip() == '':
                continue
                
            # 참여자 행인지 확인 (이름이 포함된 행)
            if '|' in line and '**' in line:
                # 참여자 이름 추출
                name_match = re.search(r'\*\*([^*]+)\*\*', line)
                if name_match:
                    participant_name = name_match.group(1)
                    
                    # 결과에서 해당 참여자 찾기
                    if participant_name in results:
                        # 해당 주차 위치에 상태 업데이트
                        updated_line = self._update_week_status(line, week, results[participant_name]['status'])
                        updated_lines.append(updated_line)
                    else:
                        # 참여자가 결과에 없으면 그대로 유지
                        updated_lines.append(line)
                else:
                    updated_lines.append(line)
            else:
                updated_lines.append(line)
        
        return '\n'.join(updated_lines)
    
    def _update_week_status(self, line: str, week: int, status: str) -> str:
        """특정 주차 위치의 상태 업데이트"""
        parts = line.split('|')
        
        # Week 1은 parts[2], Week 2는 parts[3], ..., Week 5는 parts[6]
        week_index = week + 1
        
        # 디버깅: 현재 상태 출력
        logging.info(f"Week {week} 상태 '{status}'를 인덱스 {week_index}에 삽입")
        logging.info(f"현재 행: {line}")
        logging.info(f"분할된 부분: {parts}")
        
        # 충분한 열이 있는지 확인하고 필요시 확장
        while len(parts) <= week_index:
            parts.append('')
            
        # 해당 주차 위치에 상태 삽입 (공백 없이)
        parts[week_index] = status
        
        result = '|'.join(parts)
        logging.info(f"업데이트된 행: {result}")
        
        return result
    
    def update_status_table(self, season: int, week: int, results: Dict[str, Any]) -> bool:
        """README의 최상단 표 업데이트"""
        try:
            with open(self.readme_path, 'r', encoding='utf-8') as f:
                content = f.read()
            # 현재 시즌 표 찾기
            header, table_body, start, end = self.find_current_table(content)
            if header is None:
                logging.error("현재 시즌 표를 찾을 수 없습니다")
                return False
            # 테이블 업데이트
            updated_table = self.update_table_rows(table_body, week, results)
            # 표 끝에 줄바꿈 보장
            if not updated_table.endswith('\n'):
                updated_table += '\n'
            # 표와 다음 내용 사이에 줄바꿈이 없으면 한 번 더 추가
            after_table = content[end:]
            if not after_table.startswith('\n'):
                updated_table += '\n'
            # README 업데이트
            new_content = content[:start] + header + updated_table + after_table
            with open(self.readme_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            logging.info(f"README 업데이트 완료: Season {season} Week {week}")
            return True
        except Exception as e:
            logging.error(f"README 업데이트 중 오류 발생: {e}")
            return False
    
    def create_backup(self) -> str:
        """README 백업 생성"""
        from datetime import datetime
        backup_path = f"README_backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}.md"
        try:
            with open(self.readme_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            with open(backup_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
            logging.info(f"백업 생성 완료: {backup_path}")
            return backup_path
        except Exception as e:
            logging.error(f"백업 생성 실패: {e}")
            return ""

def main():
    """메인 실행 함수"""
    try:
        # 설정 파일에서 현재 시즌/주차 정보 로드
        with open("../config/participants.json", 'r', encoding='utf-8') as f:
            config = json.load(f)
        
        current_season = config['current_season']
        current_week = config['current_week']
        
        # 결과 로드
        updater = ReadmeUpdater()
        results_data = updater.load_results(current_season, current_week)
        
        if not results_data:
            logging.error("결과 데이터를 로드할 수 없습니다")
            return
        
        results = results_data.get('results', {})
        
        # 백업 생성
        backup_path = updater.create_backup()
        
        # README 업데이트
        success = updater.update_status_table(current_season, current_week, results)
        
        if success:
            print(f"✅ README 업데이트 완료: Season {current_season} Week {current_week}")
            if backup_path:
                print(f"📁 백업 파일: {backup_path}")
        else:
            print("❌ README 업데이트 실패")
            
    except Exception as e:
        logging.error(f"실행 중 오류 발생: {e}")
        raise

if __name__ == "__main__":
    main() 