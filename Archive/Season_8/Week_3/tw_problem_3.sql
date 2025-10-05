-- Write your MySQL query statement below
-- 카테고리별로 CTE나누어 UNION

WITH low AS (
    SELECT 
        SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS 'accounts_count'
    FROM accounts
), avg AS (
    SELECT 
        SUM(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END) AS 'accounts_count'
    FROM accounts
), high AS (
    SELECT
        SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS 'accounts_count'
    FROM accounts
)

SELECT 'High Salary' AS 'category', accounts_count
FROM high
UNION ALL
SELECT 'Average Salary' AS 'category', accounts_count
FROM avg
UNION ALL
SELECT 'Low Salary' AS 'category', accounts_count
FROM low
