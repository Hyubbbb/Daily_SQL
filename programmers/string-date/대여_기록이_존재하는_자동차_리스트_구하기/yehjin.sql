SELECT DISTINCT rent.car_id
FROM car_rental_company_car AS rent
    JOIN car_rental_company_rental_history AS history
        ON rent.car_id = history.car_id
WHERE 1=1
    AND rent.car_type = '세단'
    AND MONTH(history.start_date) = 10
ORDER BY rent.car_id DESC;
