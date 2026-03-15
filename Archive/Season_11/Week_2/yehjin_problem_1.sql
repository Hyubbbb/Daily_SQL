#자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
SELECT
    cc.car_type,
    COUNT(*) AS CARS
FROM car_rental_company_car AS cc
WHERE 1=1
    AND cc.options LIKE '%통풍시트%'
    OR cc.options LIKE '%열선시트%'
    OR cc.options LIKE '%가죽시트%'
GROUP BY cc.car_type
ORDER BY cc.car_type;