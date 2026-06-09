WITH five_over_rent AS (
    SELECT
        car_id
    FROM car_rental_company_rental_history
    WHERE 1=1
        AND start_date >= '2022-08-01'
        AND start_date < '2022-11-01'
    GROUP BY car_id 
    HAVING COUNT(history_id) >= 5
)

SELECT
    MONTH(start_date) AS month,
    car_id,
    COUNT(history_id) AS records
FROM car_rental_company_rental_history
WHERE 1=1
    AND start_date >= '2022-08-01'
    AND start_date < '2022-11-01'
    AND car_id IN (SELECT car_id FROM five_over_rent)
GROUP BY MONTH(start_date), car_id
ORDER BY MONTH(start_date), car_id DESC
