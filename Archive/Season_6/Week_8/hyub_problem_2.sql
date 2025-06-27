-- https://leetcode.com/problems/employees-whose-manager-left-the-company/?envType=study-plan-v2&envId=top-sql-50
SELECT
    e1.employee_id
FROM Employees AS e1
LEFT JOIN Employees AS e2
    ON e1.manager_id = e2.employee_id
WHERE 1=1
    AND e1.salary < 30000
    AND e1.manager_id IS NOT NULL
    AND e2.employee_id IS NULL
ORDER BY employee_id
