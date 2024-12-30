-- 월별 자동차 대여 횟수 계산
SELECT 
    MONTH(START_DATE) AS MONTH, 
    CAR_ID, 
    COUNT(*) AS RECORDS
FROM 
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE 
    CAR_ID IN (
        -- 대여 횟수가 5회 이상인 자동차 ID 선택
        SELECT 
            CAR_ID
        FROM 
            CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE 
            START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
        GROUP BY 
            CAR_ID
        HAVING 
            COUNT(*) >= 5
    )
    AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY 
    MONTH(START_DATE), CAR_ID
ORDER BY 
    MONTH(START_DATE), CAR_ID DESC;
