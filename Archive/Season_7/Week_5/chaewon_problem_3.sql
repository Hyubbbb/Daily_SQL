SELECT 
    emp_id, name, department, salary, NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile,
    CASE 
        WHEN NTILE(4) OVER (ORDER BY salary DESC) = 1 THEN 'Top 25%'
        WHEN NTILE(4) OVER (ORDER BY salary DESC) = 2 THEN 'Upper Mid 25%'
        WHEN NTILE(4) OVER (ORDER BY salary DESC) = 3 THEN 'Lower Mid 25%'
        ELSE 'Bottom 25%'
    END AS salary_grade
FROM employees
ORDER BY salary DESC;