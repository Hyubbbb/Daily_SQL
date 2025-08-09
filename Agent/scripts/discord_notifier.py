#!/usr/bin/env python3
"""
디스코드 알림 스크립트
제출 현황 확인 결과를 디스코드로 알림을 보냅니다.
"""

import os
import json
import logging
import requests
from datetime import datetime
from typing import Dict, Any
from pathlib import Path

# 로깅 설정
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

SCRIPT_DIR = Path(__file__).resolve().parent           # Agent/scripts
AGENT_DIR = SCRIPT_DIR.parent                          # Agent
REPO_ROOT = AGENT_DIR.parent                           # repo root
CONFIG_PARTICIPANTS = AGENT_DIR / "config" / "participants.json"
RESULTS_DIR = AGENT_DIR / "results"

class DiscordNotifier:
    def __init__(self, webhook_url: str = None):
        """디스코드 알림기 초기화"""
        self.webhook_url = webhook_url or os.getenv('DISCORD_WEBHOOK_URL')
        if not self.webhook_url:
            logging.warning("디스코드 웹훅 URL이 설정되지 않았습니다")
    
    def load_results(self, season: int, week: int) -> Dict[str, Any]:
        """결과 파일 로드"""
        results_file = RESULTS_DIR / f"season_{season}_week_{week}_results.json"
        try:
            with open(results_file, 'r', encoding='utf-8') as f:
                return json.load(f)
        except FileNotFoundError:
            logging.error(f"결과 파일을 찾을 수 없습니다: {results_file}")
            return {}
    
    def send_notification(self, season: int, week: int, results: Dict[str, Any]) -> bool:
        """디스코드 알림 전송"""
        if not self.webhook_url:
            logging.error("디스코드 웹훅 URL이 설정되지 않았습니다")
            return False
        
        try:
            # 참여자 목록 로드 (활성 참가자만)
            with open(CONFIG_PARTICIPANTS, 'r', encoding='utf-8') as f:
                config = json.load(f)
            participants = [p['name'] for p in config['participants'] if p.get('active', True)]
            
            # 랜덤 멤버 선택
            import random
            random_member = random.choice(participants)
            
            # 메시지 생성
            message = "[TEST] Github Action으로 발송된 메시지입니다. (아직 잘못된 정보가 포함되어 있을 수 있습니다.)\n\n"
            message += f"**🙌🏻 {week}주차 제출 현황 업데이트 완료입니다 ! 🙌🏻**\n\n"
            message += f"### ✈️ {week+1}주차 시작\n"
            message += f"🏋🏻 {week+1}주차 오SQL완도 파이팅입니다 🏋🏻\n\n"
            message += f"✅ {week+1}주차 알쓸씨퀄잡 소개해주실 분은\n"
            message += f"- 👏🏻 {random_member} 님입니다 ! 👏🏻"
            
            payload = {
                "content": message
            }
            
            response = requests.post(self.webhook_url, json=payload)
            
            if response.status_code == 204:
                logging.info("디스코드 알림 전송 성공")
                return True
            else:
                logging.error(f"디스코드 알림 전송 실패: {response.status_code}")
                return False
                
        except Exception as e:
            logging.error(f"디스코드 알림 전송 중 오류: {e}")
            return False

def main():
    """메인 실행 함수"""
    try:
        # 설정 파일에서 현재 시즌/주차 정보 로드
        with open("../config/participants.json", 'r', encoding='utf-8') as f:
            config = json.load(f)
        
        current_season = config['current_season']
        current_week = config['current_week']
        
        # 결과 로드
        notifier = DiscordNotifier()
        results_data = notifier.load_results(current_season, current_week)
        
        if not results_data:
            logging.error("결과 데이터를 로드할 수 없습니다")
            return
        
        results = results_data.get('results', {})
        
        # 디스코드 알림 전송
        success = notifier.send_notification(current_season, current_week, results)
        
        if success:
            print(f"✅ 디스코드 알림 전송 완료: Season {current_season} Week {current_week}")
        else:
            print("❌ 디스코드 알림 전송 실패")
            
    except Exception as e:
        logging.error(f"실행 중 오류 발생: {e}")
        raise

if __name__ == "__main__":
    main() 