/* 1978. Employees Whose Manager Left the Company
https://leetcode.com/problems/employees-whose-manager-left-the-company/description/ */

SELECT employee_id
FROM Employees as e1
WHERE salary < 30000
    AND e1.manager_id IS NOT NULL
    AND NOT EXISTS (
        SELECT 1
        FROM Employees as e2
        WHERE e1.manager_id = e2.employee_id
    )
ORDER BY employee_id