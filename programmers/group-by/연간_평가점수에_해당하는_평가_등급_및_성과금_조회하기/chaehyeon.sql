WITH avg_score AS (
    SELECT
        emp_no,
        CASE
            WHEN AVG(score) >= 96 THEN 'S'
            WHEN AVG(score) >= 90 THEN 'A'
            WHEN AVG(score) >= 80 THEN 'B'
            ELSE 'C'
        END AS grade
    FROM hr_grade
    GROUP BY emp_no
)

SELECT
    emp.emp_no,
    emp.emp_name,
    score.grade,
    CASE score.grade
        WHEN 'S' THEN emp.sal * 0.2
        WHEN 'A' THEN emp.sal * 0.15
        WHEN 'B' THEN emp.sal * 0.1
        ELSE 0
    END AS bonus
FROM hr_employees AS emp
    JOIN avg_score AS score
        ON emp.emp_no = score.emp_no
ORDER BY emp.emp_no;
