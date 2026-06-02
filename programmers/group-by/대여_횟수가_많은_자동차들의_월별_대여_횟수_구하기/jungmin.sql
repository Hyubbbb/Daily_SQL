WITH five_or_more_car AS (
    SELECT car_id
    FROM car_rental_company_rental_history
    WHERE 1=1
        AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)

SELECT
    MONTH(start_date) AS month,
    car_id,
    COUNT(*) AS records
FROM car_rental_company_rental_history
WHERE 1=1
    AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
    AND car_id IN (SELECT * FROM five_or_more_car)
GROUP BY MONTH(start_date), car_id
ORDER BY month, car_id DESC;
