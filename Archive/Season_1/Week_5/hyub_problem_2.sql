-- # Table 1: CAR_RENTAL_COMPANY_CAR
-- # Table 2: CAR_RENTAL_COMPANY_RENTAL_HISTORY
-- # Table 3: CAR_RENTAL_COMPANY_DISCOUNT_PLAN

-- # 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서, 대여 기록 별로 대여 금액(컬럼명: FEE)을 구하여 대여 기록 ID와 대여 금액 리스트를 출력
--     # 결과는 대여 금액을 기준으로 내림차순 정렬
--     # 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순 정렬

-- # 1. Table 2와 Table 1을 JOIN해서 CAR_TYPE '트럭' 확인 + DAILY_FEE 추가
-- # 2. Table 3의 DURATION_TYPE을 어떻게 엮지

WITH Table_tmp AS(
    SELECT HISTORY_ID, 
           h.CAR_ID, 
           (DATEDIFF(END_DATE, START_DATE) + 1) AS DAY,
           CASE 
           WHEN (DATEDIFF(END_DATE, START_DATE) + 1) >= 90 THEN '90일 이상'
           WHEN (DATEDIFF(END_DATE, START_DATE) + 1) >= 30 THEN '30일 이상'
           WHEN (DATEDIFF(END_DATE, START_DATE) + 1) >=  7 THEN '7일 이상'
           ELSE '해당 없음'
           END AS DURATION_TYPE,
           c.CAR_TYPE,
           c.DAILY_FEE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
        JOIN CAR_RENTAL_COMPANY_CAR c 
            on h.CAR_ID = c.CAR_ID
)

SELECT HISTORY_ID, 
       ROUND(DAY * DAILY_FEE * (100-IFNULL(DISCOUNT_RATE, 0)) / 100) AS FEE
FROM Table_tmp tmp
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN dc 
    on tmp.CAR_TYPE = dc.CAR_TYPE AND tmp.DURATION_TYPE = dc.DURATION_TYPE
WHERE tmp.CAR_TYPE = '트럭' 
ORDER BY FEE DESC, HISTORY_ID DESC
