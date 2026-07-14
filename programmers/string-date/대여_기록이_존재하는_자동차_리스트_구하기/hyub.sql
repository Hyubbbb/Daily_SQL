SELECT
    car.car_id
FROM car_rental_company_car AS car
WHERE 1=1
    AND car.car_type = '세단'
    AND EXISTS (
        SELECT 1
        FROM car_rental_company_rental_history AS hist
        WHERE 1=1
            AND car.car_id = hist.car_id
            AND hist.start_date BETWEEN '2022-10-01' AND '2022-10-31'
        )
ORDER BY car_id DESC