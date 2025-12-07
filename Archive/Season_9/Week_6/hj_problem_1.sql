-- https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&envId=top-sql-50
SELECT
    name,
    bonus
FROM employee AS e
    LEFT JOIN bonus AS b
        ON e.empid = b.empid
WHERE
    b.bonus < 1000
    OR b.bonus IS NULL;
