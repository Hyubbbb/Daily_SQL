-- https://solvesql.com/problems/dvdrental-vip/
SELECT
    rent.customer_id
FROM rental AS rent
    JOIN customer AS cus
        ON rent.customer_id = cus.customer_id
WHERE 1=1
    AND cus.active = 1
GROUP BY customer_id
HAVING COUNT(*) >= 35
