WITH child AS(
    SELECT 
        car_id
    FROM car_rental_company_rental_history
    WHERE 1=1
        AND start_date BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)

SELECT 
    MONTH(p.start_date) AS month,
    p.car_id,
    COUNT(*) AS records
FROM car_rental_company_rental_history AS p
    JOIN child AS c
        ON p.car_id = c.car_id
WHERE 1=1
    AND p.start_date BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY MONTH(p.start_date), car_id
ORDER BY month, car_id DESC;
