-- https://leetcode.com/problems/count-salary-categories/?envType=study-plan-v2&envId=top-sql-50
WITH CTE AS (
SELECT
    CASE
    WHEN income <  20000 THEN "Low Salary"
    WHEN income <= 50000 THEN "Average Salary"
    WHEN income >  50000 THEN "High Salary"
    END AS category,
    COUNT(*) AS accounts_count
FROM Accounts
GROUP BY category
),
CAT AS (
    SELECT "Low Salary" AS category
    UNION ALL
    SELECT "Average Salary"
    UNION ALL
    SELECT "High Salary"
)
SELECT
    c1.category,
    IFNULL(c2.accounts_count, 0) AS accounts_count
FROM CAT c1
LEFT JOIN CTE c2
    ON c1.category = c2.category
