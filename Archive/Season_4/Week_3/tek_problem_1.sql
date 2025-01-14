/* 1789. Primary Department for Each Employee
https://leetcode.com/problems/primary-department-for-each-employee/description/ */

SELECT c.employee_id, c.department_id
FROM (
    SELECT *, COUNT(*) OVER (PARTITION BY employee_id) as cnt
    FROM Employee
) as c
WHERE c.cnt = 1 OR c.primary_flag = 'Y'