WITH filtered_car_history AS (
    SELECT
        car_id,
        start_date
    FROM car_rental_company_rental_history
    WHERE 1=1
        AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
),
    
valid_car_list AS (
    SELECT
        car_id
    FROM filtered_car_history
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)

SELECT
    MONTH(fh.start_date) AS month,
    fh.car_id,
    COUNT(*) AS records
FROM filtered_car_history AS fh
    JOIN valid_car_list AS vl
        ON fh.car_id = vl.car_id
GROUP BY MONTH(fh.start_date), fh.car_id
ORDER BY month, fh.car_id DESC;
