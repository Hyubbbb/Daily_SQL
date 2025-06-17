-- https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&envId=top-sql-50

SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION ALL

SELECT
    employee_id,
    department_id
FROM Employee
GROUP BY employee_id
    HAVING COUNT(*) = 1
