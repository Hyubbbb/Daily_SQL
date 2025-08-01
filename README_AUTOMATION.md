# SQL 스터디 자동화 시스템 사용법

## 개요

이 시스템은 SQL 스터디 참여자들의 제출 현황을 자동으로 확인하고, README를 업데이트하며, 디스코드로 알림을 보내는 자동화 도구입니다.

**매주 금요일 자정에 GitHub Actions를 통해 자동으로 실행됩니다.**

## 파일 구조

```
Daily_SQL/
├── .github/workflows/          # GitHub Actions 워크플로우
│   └── weekly_check.yml       # 주간 자동 실행 설정
├── config/                     # 설정 파일들
│   ├── participants.json       # 참여자 정보
│   └── seasons.json           # 시즌별 설정
├── scripts/                    # 자동화 스크립트들
│   ├── submission_checker.py   # 제출 현황 확인
│   ├── readme_updater.py      # README 업데이트
│   ├── discord_notifier.py    # 디스코드 알림
│   └── main.py                # 메인 실행 스크립트
├── results/                    # 결과 파일들 (자동 생성)
└── requirements.txt            # Python 패키지 목록
```

## 설정 방법

### 1. 참여자 정보 설정 (`config/participants.json`)

```json
{
  "current_season": 7,
  "current_week": 5,
  "submission_deadline": "friday_23:59",
  "late_deadline": "saturday_23:59",
  "participants": [
    {
      "name": "김협",
      "file_prefix": "hyub",
      "required_problems": 3,
      "discord_id": "123456789"
    }
  ]
}
```

### 2. 시즌 정보 설정 (`config/seasons.json`)

```json
{
  "seasons": {
    "7": {
      "start_date": "2025-06-28",
      "end_date": "2025-08-30",
      "weeks": 9,
      "active": true
    }
  }
}
```

## GitHub Actions 설정

### 1. 자동 실행 스케줄

- **실행 시간**: 매주 금요일 자정 (한국 시간)
- **실행 환경**: GitHub의 Ubuntu 서버
- **실행 내용**: 제출 현황 확인 → README 업데이트 → 디스코드 알림

### 2. 디스코드 웹훅 설정

1. **GitHub Secrets 설정**:
   - GitHub 레포지토리 → Settings → Secrets and variables → Actions
   - New repository secret 클릭
   - Name: `DISCORD_WEBHOOK_URL`
   - Value: 디스코드 웹훅 URL 입력

2. **디스코드 웹훅 생성**:
   - 디스코드 서버에서 알림을 받을 채널 선택
   - 채널 설정 → 연동 → 웹훅 생성
   - 웹훅 URL 복사

## 사용법

### 1. 로컬 테스트

```bash
# Python 패키지 설치
pip install -r requirements.txt

# 전체 자동화 실행
python scripts/main.py

# 컴포넌트 테스트 실행
python scripts/main.py --test
```

### 2. 수동 실행

GitHub 레포지토리 → Actions → "Weekly SQL Submission Check" → "Run workflow"

### 3. 자동 실행

매주 금요일 자정에 자동으로 실행됩니다.

## 실제 테스트 결과

### Week 1 테스트 결과
```
=== Season 7 Week 1 제출 현황 ===
김협: ⏰ (2/3) - 지각 제출
송태원: ✅ (2/2) - 제출 완료
이지윤: ✅ (2/2) - 제출 완료
송채원: ✅ (3/3) - 제출 완료
이형주: ✅ (3/3) - 제출 완료
```

### Week 5 테스트 결과
```
=== Season 7 Week 5 제출 현황 ===
김협: ✅ (2/2) - 제출 완료
송태원: ❌ (0/2) - 미제출
이지윤: ❌ (0/2) - 미제출
송채원: ❌ (0/3) - 미제출
이형주: ❌ (0/2) - 미제출
```

## 제출 현황 판단 기준

- **✅ 제출 완료**: 할당된 문제 수 이상 제출
- **⏰ 지각 제출**: 일부 문제만 제출 (1개 이상)
- **❌ 미제출**: 아무 문제도 제출하지 않음

## 파일명 규칙

참여자들이 제출해야 하는 파일명 형식:
```
{file_prefix}_problem_{번호}.sql
```

예시:
- `hyub_problem_1.sql`
- `hyub_problem_2.sql`
- `hyub_problem_3.sql`

## 로그 파일

- `submission_check.log`: 제출 확인 로그
- `automation.log`: 전체 자동화 로그
- `results/season_X_week_Y_results.json`: 제출 현황 결과

## 문제 해결

### 1. 설정 파일 오류
```
FileNotFoundError: config/participants.json
```
- `config/participants.json` 파일이 존재하는지 확인
- JSON 형식이 올바른지 확인

### 2. 디스코드 알림 실패
```
디스코드 웹훅 URL이 설정되지 않았습니다
```
- GitHub Secrets에 `DISCORD_WEBHOOK_URL` 설정
- 웹훅 URL이 유효한지 확인

### 3. README 업데이트 실패
```
현재 시즌 표를 찾을 수 없습니다
```
- README.md에 `| Week/Member |` 헤더가 있는 표가 있는지 확인
- 표 형식이 올바른지 확인

## 주의사항

1. **백업**: README 업데이트 전에 자동으로 백업이 생성됩니다
2. **로깅**: 모든 작업은 로그 파일에 기록됩니다
3. **에러 처리**: 각 단계에서 오류가 발생해도 다음 단계로 진행됩니다
4. **GitHub Actions**: 컴퓨터를 켜지 않아도 자동으로 실행됩니다

## 성공적인 구현 완료! ✅

이제 매주 금요일 자정에 GitHub Actions를 통해 자동으로 제출 현황을 확인하고 README를 업데이트하며 디스코드로 알림을 보내는 완전 자동화된 시스템이 구축되었습니다. 