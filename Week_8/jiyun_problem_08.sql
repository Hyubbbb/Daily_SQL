-- 코드를 입력하세요
WITH DURATION_TABLE AS(
    SELECT HISTORY_ID, CAR_ID, START_DATE, END_DATE,
        CASE WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 90 THEN '90일 이상'
             WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 30 THEN '30일 이상'
             WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 7  THEN '7일 이상'
             ELSE 0
        END AS DURATION
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY)

SELECT HISTORY_ID, 
    CASE WHEN DURATION IN ('90일 이상', '30일 이상', '7일 이상') THEN 
        ROUND(DAILY_FEE*(1-DISCOUNT_RATE/100)*(DATEDIFF(END_DATE, START_DATE)+1), 0)
        ELSE ROUND(DAILY_FEE*(DATEDIFF(END_DATE, START_DATE)+1), 0)
        END AS FEE
    FROM DURATION_TABLE A
    JOIN (SELECT CAR_ID, DAILY_FEE FROM CAR_RENTAL_COMPANY_CAR WHERE CAR_TYPE = '트럭') B
            ON A.CAR_ID = B.CAR_ID
        LEFT JOIN (SELECT DURATION_TYPE, DISCOUNT_RATE FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                    WHERE CAR_TYPE = '트럭') C
            ON A.DURATION = C.DURATION_TYPE
ORDER BY FEE DESC, HISTORY_ID DESC;