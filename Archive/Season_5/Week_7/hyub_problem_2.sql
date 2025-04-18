-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50

SELECT name
FROM Employee
WHERE id IN (
    SELECT
        managerId
    FROM Employee a
    GROUP BY managerId
        HAVING COUNT(*) >= 5)
