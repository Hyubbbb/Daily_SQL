WITH sedan AS (
    SELECT *
    FROM car_rental_company_car
    WHERE 1=1
        AND car_type = '세단'
),
oct_rent AS (
    SELECT *
    FROM car_rental_company_rental_history
    WHERE 1=1
        AND start_date BETWEEN '2022-10-01' AND '2022-10-31'
)
SELECT DISTINCT sedan.car_id
FROM sedan
    JOIN oct_rent
        ON sedan.car_id = oct_rent.car_id
ORDER BY sedan.car_id DESC;
