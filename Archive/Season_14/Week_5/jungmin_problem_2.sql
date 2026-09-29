-- https://datalemur.com/questions/sql-well-paid-employees
SELECT 
    e2.employee_id AS employee_id,
    e2.name AS employee_name
FROM employee AS e1
    INNER JOIN employee AS e2
        ON e1.employee_id = e2.manager_id
WHERE 1=1
    AND e1.salary < e2.salary;
