-- programmers (GROUP BY) : 조건에 맞는 사원 정보 조회하기 (LEVEL 2)
SELECT
    SUM(hg.score) AS score,
    he.emp_no,
    he.emp_name,
    he.position,
    he.email
FROM hr_employees AS he
    LEFT JOIN hr_grade AS hg
        ON he.emp_no = hg.emp_no
GROUP BY he.emp_no
ORDER BY score DESC
LIMIT 1;
