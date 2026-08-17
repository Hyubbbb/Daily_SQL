-- https://solvesql.com/problems/ab-testing-buckets-2/
WITH bucket_tbl AS (
    SELECT
        customer_id,
        CASE
            WHEN customer_id % 10 = 0
                THEN 'A'
            ELSE 'B'
        END AS bucket,
        COUNT(DISTINCT transaction_id) AS  orders,
        SUM(total_price) AS revenue
    FROM transactions
    WHERE 1=1
        AND is_returned = FALSE
    GROUP BY customer_id
)
SELECT
    bucket,
    COUNT(customer_id) AS user_count,
    ROUND(AVG(orders), 2) AS avg_orders,
    ROUND(AVG(revenue), 2) AS avg_revenue
FROM bucket_tbl
GROUP BY bucket
