-- 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기 (programmers - GROUP BY)
-- LIKE 사용이 아직 익숙치 않다,,
-- https://chunggaeguri.tistory.com/entry/MySQL-LIKE-%EB%AC%B8%EB%B2%95-%EC%82%AC%EC%9A%A9%EB%B2%95-%EB%B0%8F-%EC%98%88%EC%A0%9C

SELECT CAR_TYPE, COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR

WHERE
    OPTIONS LIKE '%통풍시트%'
    OR OPTIONS LIKE '%열선시트%'
    OR OPTIONS LIKE '%가죽시트%'
    
-- 콤마로 구분되어 나열되어 있는 OPTIONS 컬럼 내에서 특정 옵션이 포함되는지를 찾기 위해선 % 연산자를 이용해 앞뒤 사이에 있는 값을 찾아내도록 해줘야 하는 것
-- 조건 여러개 나열하고자 할 시, IN은 불가능, LIKE문이 적절!
  
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE
