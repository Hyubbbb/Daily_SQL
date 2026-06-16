SELECT
    emp.emp_no,
    emp.emp_name,
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
            THEN emp.sal * 0.2
        WHEN AVG(grade.score) >= 90
            THEN emp.sal * 0.15
        WHEN AVG(grade.score) >= 80
            THEN emp.sal * 0.1
        ELSE 0
    END AS bonus
FROM hr_employees AS emp
    JOIN hr_grade AS grade
        ON emp.emp_no = grade.emp_no
GROUP BY emp.emp_no, emp.emp_name
ORDER BY emp.emp_no;
