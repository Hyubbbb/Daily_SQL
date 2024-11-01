평균 일일 대여 요금 구하기 | https://school.programmers.co.kr/learn/courses/30/lessons/151136

SELECT ROUND(AVG(DAILY_FEE),0) AS AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
GROUP BY CAR_TYPE
HAVING CAR_TYPE = 'SUV'
