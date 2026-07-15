SELECT
    car_id,
    car_type,
    daily_fee,
    options
FROM car_rental_company_car
WHERE 1=1
    AND options LIKE '%네비게이션%'
ORDER BY car_id DESC