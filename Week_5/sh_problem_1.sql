-- 특정 옵션이 포함된 자동차 리스트 구하기
SELECT *
FROM car_rental_company_car
WHERE options like '%네비게이션%'
ORDER BY car_id desc