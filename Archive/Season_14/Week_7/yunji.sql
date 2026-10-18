-- SELECT > 조건에 맞는 개발자 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/276034

WITH skill_mask AS (
    SELECT
        SUM(code) AS code_mask
    FROM skillcodes
    WHERE 1=1
        AND name IN ('Python', 'C#')
)
SELECT
    d.id,
    d.email,
    d.first_name,
    d.last_name
FROM developers AS d
CROSS JOIN skill_mask AS m
WHERE 1=1
    AND d.skill_code & m.code_mask > 0
ORDER BY d.id;
