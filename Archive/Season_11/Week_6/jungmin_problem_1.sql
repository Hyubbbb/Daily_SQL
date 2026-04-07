-- https://solvesql.com/problems/sales-summary/
WITH daily_sales AS (
    SELECT
        day,
        SUM(total_bill) AS sales
    FROM tips
    GROUP BY day
)

SELECT ROUND(AVG(sales), 2) AS avg_sales
FROM daily_sales
