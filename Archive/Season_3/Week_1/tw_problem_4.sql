-- 1. 대여 시작일이 2022년 9월에 속하는 대여 기록
-- 2. 대여 기간이 30일 이상이면 '장기 대여' 그렇지 않으면 '단기 대여' 로 표시하는 컬럼(컬럼명: RENT_TYPE)을 추가
-- 뭔가 놓치고 있을 땐, 출력 결과를 유심히 분석해보자
-- 빌린 당일날 반납한 것은 1일 대여한 것으로 쳐라..? = 대여일부터 1일차라 단순히 날짜 차이를 기준으로 하면 29일 이상부터 '장기 대여' 이게 뭔ㅋㅋ


SELECT HISTORY_ID, CAR_ID, DATE_FORMAT(START_DATE, "%Y-%m-%d") AS START_DATE, DATE_FORMAT(END_DATE, "%Y-%m-%d") AS END_DATE, IF(DATEDIFF(END_DATE, START_DATE)>=29, "장기 대여", "단기 대여") AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE YEAR(START_DATE) = 2022 AND MONTH(START_DATE) = 09
ORDER BY HISTORY_ID DESC
