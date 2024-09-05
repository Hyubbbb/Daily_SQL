-- LEVEL1 : 평균 일일 대여 요금 구하기 ##

SELECT ROUND(AVG(DAILY_FEE), 0) AS AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV'

/* ROUND(value, N) : value의 소숫점 아래 N자리까지 표현 */