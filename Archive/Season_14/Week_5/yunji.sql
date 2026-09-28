-- https://school.programmers.co.kr/learn/courses/30/lessons/151137
-- GROUP BY / 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기

SELECT
    car_type,
    COUNT(*) AS cars
FROM car_rental_company_car
WHERE options LIKE '%통풍시트%' 
    OR options LIKE '%열선시트%'
    OR options LIKE '%가죽시트%'
GROUP BY car_type
ORDER BY car_type;
