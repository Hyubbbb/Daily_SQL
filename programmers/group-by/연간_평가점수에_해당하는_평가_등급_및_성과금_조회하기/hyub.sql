WITH emp_avg_score AS (
    SELECT
        emp_no,
        AVG(score) AS avg_score
    FROM hr_grade
    GROUP BY emp_no
)
SELECT
    employees.emp_no,
    employees.emp_name,
    CASE
        WHEN avg_score >= 96
            THEN 'S'
        WHEN avg_score >= 90
            THEN 'A'
        WHEN avg_score >= 80
            THEN 'B'
        ELSE 'C'
    END AS grade,
    CASE
        WHEN avg_score >= 96
            THEN employees.sal * 0.2
        WHEN avg_score >= 90
            THEN employees.sal * 0.15
        WHEN avg_score >= 80
            THEN employees.sal * 0.1
        ELSE 0
    END AS bonus
FROM emp_avg_score AS grade
    JOIN hr_employees AS employees
        ON grade.emp_no = employees.emp_no
ORDER BY employees.emp_no;