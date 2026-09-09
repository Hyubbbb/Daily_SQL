# Programmers: 특정 옵션이 포함된 자동차 리스트 구하기
# Link: https://school.programmers.co.kr/learn/courses/30/lessons/157343
SELECT 
    car_id,
    car_type,
    daily_fee,
    options
FROM car_rental_company_car
WHERE 1=1
    AND options LIKE '%네비게이션%'
ORDER BY car_id DESC;
