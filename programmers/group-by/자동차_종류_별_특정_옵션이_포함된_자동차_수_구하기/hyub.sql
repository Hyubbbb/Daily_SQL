SELECT
    car_type,
    COUNT(*) AS cars
FROM car_rental_company_car
WHERE 1=1
    AND options REGEXP '통풍시트|열선시트|가죽시트'
GROUP BY car_type
ORDER BY car_type