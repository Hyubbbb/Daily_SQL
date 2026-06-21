SELECT
    employees.emp_no,
    employees.emp_name,
    CASE
        WHEN AVG(grade.score) >= 96 
            THEN 'S'
        WHEN AVG(grade.score) >= 90 
            THEN 'A'
        WHEN AVG(grade.score) >= 80 
            THEN 'B'
        ELSE 'C'
    END AS grade,
    CASE
        WHEN AVG(grade.score) >= 96 
            THEN employees.sal * 0.2
        WHEN AVG(grade.score) >= 90 
            THEN employees.sal * 0.15
        WHEN AVG(grade.score) >= 80 
            THEN employees.sal * 0.1
        ELSE 0
    END AS bonus
FROM hr_employees employees
    JOIN hr_grade grade
        ON employees.emp_no = grade.emp_no
GROUP BY employees.emp_no
ORDER BY employees.emp_no
