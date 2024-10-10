-- 평균 일일 대여 요금 구하기
SELECT round(avg(daily_fee),0) as average_fee
FROM car_rental_company_car
WHERE car_type="SUV"