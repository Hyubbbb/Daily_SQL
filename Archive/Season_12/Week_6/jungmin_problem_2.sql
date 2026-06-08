-- https://solvesql.com/problems/high-season-of-restaurant/
WITH days_over_1500 AS (
    SELECT
        day,
        SUM(total_bill) AS sum_total_bill
    FROM tips
    GROUP BY day
    HAVING SUM(total_bill) >= 1500
)
SELECT tips.*
FROM tips
    JOIN days_over_1500
        ON tips.day = days_over_1500.day
