-- LV2 / GROUP BY / 조건에 맞는 사원 정보 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/284527

SELECT
    SUM(g.score) AS score,
    g.emp_no,
    e.emp_name,
    e.position,
    e.email
FROM hr_grade AS g
    INNER JOIN hr_employees AS e
        ON g.emp_no = e.emp_no
WHERE g.year = 2022
GROUP BY g.emp_no
ORDER BY score DESC LIMIT 1;
