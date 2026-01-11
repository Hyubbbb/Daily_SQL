-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50
WITH mcount AS (
    SELECT managerid
    FROM employee
    GROUP BY managerid
    HAVING COUNT(*) >= 5
)
SELECT e.name
FROM employee e
    JOIN mcount m 
        ON e.id = m.managerid;
