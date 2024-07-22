-- # Table 1: CAR_RENTAL_COMPANY_CAR
-- # Table 2: CAR_RENTAL_COMPANY_RENTAL_HISTORY


-- # 자동차 종류가 '세단'인 자동차들 중 10월에 대여를 시작한 기록이 있는 자동차 ID 리스트를 출력
-- # 자동차 ID 리스트는 중복이 없어야 하며, 자동차 ID를 기준으로 내림차순 정렬

SELECT c.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR c
    JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY h on c.CAR_ID = h.CAR_ID
WHERE CAR_TYPE = '세단'
GROUP BY c.CAR_ID
    HAVING SUM(IF(MONTH(START_DATE)=10, 1, 0)) > 0
ORDER BY CAR_ID DESC
