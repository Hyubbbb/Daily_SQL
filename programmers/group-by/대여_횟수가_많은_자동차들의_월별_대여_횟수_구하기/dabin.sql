WITH frequent_car AS (
    SELECT
        crcrh.car_id AS car_id
    FROM car_rental_company_rental_history AS crcrh
    WHERE 1=1
        AND crcrh.start_date BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)

SELECT
    MONTH(crcrh.start_date) AS month,
    crcrh.car_id AS car_id,
    COUNT(*) AS records
FROM car_rental_company_rental_history AS crcrh
    INNER JOIN frequent_car AS fc
        ON crcrh.car_id = fc.car_id
WHERE 1=1
    AND crcrh.start_date BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY month, car_id
ORDER BY month, car_id DESC
