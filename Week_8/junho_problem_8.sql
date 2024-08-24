WITH CAR_RENTAL AS (
                    SELECT c.DAILY_FEE, h.HISTORY_ID, 
                            CASE WHEN (DATEDIFF(END_DATE,START_DATE)+1) >= 90 THEN '90일 이상'
                                WHEN (DATEDIFF(END_DATE,START_DATE)+1) >=  30 THEN '30일 이상'
                                WHEN (DATEDIFF(END_DATE,START_DATE)+1) >= 7 THEN '7일 이상'
                                ELSE '할인 없음' 
                                END AS DURATION_TYPE, (DATEDIFF(END_DATE,START_DATE)+1) AS DAYS
                    FROM CAR_RENTAL_COMPANY_CAR AS c
                    JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
                    ON c.CAR_ID = h.CAR_ID
                    WHERE c.CAR_TYPE = '트럭'
),

CAR_RENTAL_DISCOUNT AS (
                        SELECT DURATION_TYPE, DISCOUNT_RATE
                        FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                        WHERE CAR_TYPE = '트럭'
)


SELECT HISTORY_ID,
        CASE WHEN r.DURATION_TYPE = '할인 없음' THEN DAILY_FEE * DAYS
            ELSE ROUND(DAILY_FEE / 100 * (100-d.DISCOUNT_RATE) * DAYS)
            END AS FEE
FROM CAR_RENTAL AS r
LEFT OUTER JOIN CAR_RENTAL_DISCOUNT AS d
ON r.DURATION_TYPE = d.DURATION_TYPE
ORDER BY 2 DESC, 1 DESC;
