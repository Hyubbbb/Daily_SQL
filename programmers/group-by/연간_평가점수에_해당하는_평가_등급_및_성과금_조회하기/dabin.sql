-- 연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기
WITH employee_avg_grade AS (
    SELECT
        e.emp_no,
        e.emp_name,
        e.sal,
        AVG(g.score) AS avg_score
    FROM hr_employees AS e
        INNER JOIN hr_grade AS g
            ON e.emp_no = g.emp_no
    GROUP BY
        e.emp_no,
        e.emp_name,
        e.sal
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
