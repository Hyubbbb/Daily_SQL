-- https://leetcode.com/problems/restaurant-growth/?envType=study-plan-v2&envId=top-sql-50
WITH TMP AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
TMP2 AS (
    SELECT
        visited_on,
        SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
        ROW_NUMBER() OVER (ORDER BY visited_on ASC) AS rn
    FROM TMP
)
SELECT
    visited_on,
    amount,
    average_amount
FROM TMP2
WHERE rn >= 7
ORDER BY visited_on ASC
