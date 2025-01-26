/* 1907. Count Salary Categories
https://leetcode.com/problems/count-salary-categories/description/ */

WITH CTE AS (
    SELECT *,
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END as category
    FROM Accounts
)

SELECT category, count(category) as accounts_count
FROM CTE
GROUP BY category
UNION
SELECT t2.category, 0
FROM (
    SELECT UNNEST(ARRAY['Low Salary', 'Average Salary','High Salary']) as category
    EXCEPT
    SELECT DISTINCT category
    FROM CTE
) as t2


-- SELECT COALESCE(
--     (SELECT income
--      FROM CTE 
--      WHERE category NOT IN ('Low Salary', 'Average Salary', 'High Salary')
--      LIMIT 1)
-- ) AS category
-- -- FROM CTE