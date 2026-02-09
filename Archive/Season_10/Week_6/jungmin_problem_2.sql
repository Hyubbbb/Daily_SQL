-- https://school.programmers.co.kr/learn/courses/30/lessons/276034
WITH total AS (
    SELECT SUM(code) AS total
    FROM skillcodes
    WHERE 1=1
        AND name IN ('c#', 'python')
)

SELECT
    d.id,
    d.email,
    d.first_name,
    d.last_name
FROM developers AS d
    JOIN total AS t
        ON d.skill_code & t.total > 0
ORDER BY d.id
