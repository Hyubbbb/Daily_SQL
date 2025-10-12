SELECT employee_id
FROM employees
WHERE salary < 30000
    AND manager_id NOT IN 
    (SELECT DISTINCT(employee_id)
    FROM employees)
ORDER BY 1
