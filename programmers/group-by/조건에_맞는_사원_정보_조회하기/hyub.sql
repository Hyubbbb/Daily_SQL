WITH ranked_emp AS (
    SELECT
        emp_no,
        SUM(score) AS ttl_score,
        RANK() OVER (ORDER BY SUM(score) DESC) AS rnk
    FROM hr_grade
    GROUP BY emp_no
)
SELECT
    re.ttl_score AS score,
    re.emp_no,
    he.emp_name,
    he.position,
    he.email
FROM ranked_emp AS re
JOIN hr_employees AS he
    ON re.emp_no = he.emp_no
WHERE 1=1
    AND re.rnk = 1;