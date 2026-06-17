WITH emp_grade AS (
    SELECT
        emp_no,
        CASE
            WHEN AVG(score) >= 96
                THEN 'S'
            WHEN AVG(score) >= 90
                THEN 'A'
            WHEN AVG(score) >= 80
                THEN 'B'
            ELSE 'C'
        END AS grade
    FROM hr_grade
    GROUP BY emp_no
)

SELECT 
    gr.emp_no,
    emp.emp_name,
    gr.grade,
    CASE
        WHEN gr.grade = 'S'
            THEN emp.sal * 0.2
        WHEN gr.grade = 'A'
            THEN emp.sal * 0.15
        WHEN gr.grade = 'B'
            THEN emp.sal * 0.1
        ELSE 0
    END AS bonus
FROM emp_grade AS gr
    INNER JOIN hr_employees AS emp
        ON gr.emp_no = emp.emp_no
ORDER BY emp.emp_no;
