WITH popular_cars AS (
    SELECT
        car_id
    FROM car_rental_company_rental_history
    WHERE 1=1
        AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY car_id
    HAVING COUNT(history_id) >= 5
)

SELECT
    MONTH(history.start_date) AS month,
    history.car_id,
    COUNT(history.history_id) AS records
FROM car_rental_company_rental_history AS history
    INNER JOIN popular_cars AS car_table
    ON history.car_id = car_table.car_id
WHERE 1=1
    AND history.start_date BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH(history.start_date), history.car_id
ORDER BY month ASC, history.car_id DESC;