SELECT customer_number
FROM (
    SELECT customer_number, COUNT(order_number) AS cnt
    FROM Orders
    GROUP BY customer_number
    ORDER BY cnt DESC
) TMP
LIMIT 1
