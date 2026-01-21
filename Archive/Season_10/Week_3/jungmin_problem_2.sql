-- https://school.programmers.co.kr/learn/courses/30/lessons/151137
SELECT
    car_type,
    COUNT(*) AS cars
FROM car_rental_company_car
WHERE 1=1
    AND options LIKE '%시트%'
GROUP BY car_type
ORDER BY car_type;
