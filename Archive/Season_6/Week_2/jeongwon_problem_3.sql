-- 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/151139

WITH FILTERED_HISTORY AS (
    SELECT 
        CAR_ID,
        EXTRACT(MONTH FROM START_DATE) AS MONTH
    FROM 
        CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE 
        START_DATE BETWEEN DATE '2022-08-01' AND DATE '2022-10-31'
),
CAR_TOTAL_COUNT AS (
    SELECT 
        CAR_ID
    FROM 
        FILTERED_HISTORY
    GROUP BY 
        CAR_ID
    HAVING 
        COUNT(*) >= 5
)
SELECT 
    F.MONTH,
    F.CAR_ID,
    COUNT(*) AS RECORDS
FROM FILTERED_HISTORY F
JOIN 
    CAR_TOTAL_COUNT C
    ON F.CAR_ID = C.CAR_ID
GROUP BY F.MONTH, F.CAR_ID
ORDER BY F.MONTH ASC, F.CAR_ID DESC;
