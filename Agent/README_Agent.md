🔄 수정 순서
1. Agent/config/participants.json 수정
  - current_season → 새로운 시즌 번호
  - current_week → 1로 리셋
  - participants 배열 → 새로운 참가자 목록 (active를 true로)
2. Agent/config/seasons.json 수정
  - 새로운 시즌 정보 추가
  - 이전 시즌 active: false로 변경
3. README.md 수정
   - 제출 현황 표 업데이트