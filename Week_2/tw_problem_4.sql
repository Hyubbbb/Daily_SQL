-- 평균 일일 대여 요금 구하기(programmers-SELECT)
-- 반올림 다룰 땐 ROUND(값, 자릿수)!
SELECT round(SUM(DAILY_FEE)/COUNT(*), 0) AS AVERAGE_FEE

FROM CAR_RENTAL_COMPANY_CAR

WHERE CAR_TYPE = 'SUV'
