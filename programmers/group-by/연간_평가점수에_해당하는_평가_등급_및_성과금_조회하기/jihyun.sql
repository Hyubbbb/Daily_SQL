WITH employee_avg_grade AS (
    SELECT
        emp.emp_no,
        emp.emp_name,
        emp.sal,
        AVG(grade.score) AS avg_score
    FROM hr_employees AS emp
        INNER JOIN hr_grade AS grade
            ON emp.emp_no = grade.emp_no
    GROUP BY
        emp.emp_no,
        emp.emp_name,
        emp.sal
)

SELECT
    emp_no,
    emp_name,
    CASE
        WHEN avg_score >= 96 THEN 'S'
        WHEN avg_score >= 90 THEN 'A'
        WHEN avg_score >= 80 THEN 'B'
        ELSE 'C'
    END AS grade,
    CASE
        WHEN avg_score >= 96 THEN sal * 0.2
        WHEN avg_score >= 90 THEN sal * 0.15
        WHEN avg_score >= 80 THEN sal * 0.1
        ELSE 0
    END AS bonus
FROM employee_avg_grade
ORDER BY emp_no
