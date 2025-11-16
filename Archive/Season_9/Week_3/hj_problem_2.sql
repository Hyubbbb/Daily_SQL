-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50
SELECT 
    e2.unique_id, 
    e1.name
FROM employees e1
    LEFT JOIN employeeuni e2
        ON e1.id = e2.id;
