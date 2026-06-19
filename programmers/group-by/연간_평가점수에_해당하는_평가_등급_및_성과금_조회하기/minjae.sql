WITH employee_score AS (
    SELECT
        emp_no,
        AVG(score) AS average_score
    FROM hr_grade
    GROUP BY emp_no
)

SELECT
    empl.emp_no,
    empl.emp_name,
    CASE
        WHEN avgsc.average_score >= 96
            THEN 'S'
        WHEN avgsc.average_score >= 90
            THEN 'A'
        WHEN avgsc.average_score >= 80
            THEN 'B'
        ELSE 'C'
    END AS grade,
    CASE
        WHEN avgsc.average_score >= 96
            THEN empl.sal * 0.2
        WHEN avgsc.average_score >= 90
            THEN empl.sal * 0.15
        WHEN avgsc.average_score >= 80
            THEN empl.sal * 0.1
        ELSE 0
    END AS bonus
FROM hr_employees AS empl
    INNER JOIN employee_score AS avgsc
        ON empl.emp_no = avgsc.emp_no
ORDER BY empl.emp_no;