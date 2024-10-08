-- 코드를 입력하세요
# 조건1: 자동차 종류가 '세단'
# 조건2: 10월에 대여를 시작한 기록 O
# 조건3: 중복X
  
SELECT DISTINCT A.CAR_ID
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A LEFT JOIN CAR_RENTAL_COMPANY_CAR B
    ON A.CAR_ID = B.CAR_ID
WHERE CAR_TYPE = '세단' AND START_DATE LIKE '2022-10%'
ORDER BY CAR_ID DESC;
