-- https://datalemur.com/questions/completed-trades
SELECT
    u.city,
    COUNT(DISTINCT t.order_id) AS total_orders
FROM trades AS t
    JOIN users AS u
        ON t.user_id = u.user_id
WHERE 1=1
    AND t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;
