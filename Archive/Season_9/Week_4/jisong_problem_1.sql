-- https://school.programmers.co.kr/learn/courses/30/lessons/276035

SELECT
    d.id          AS id,
    d.email       AS email,
    d.first_name  AS first_name,
    d.last_name   AS last_name
FROM developers AS d
WHERE 1=1
    AND EXISTS (
        SELECT
            1
        FROM skillcodes AS s
        WHERE 1=1
            AND s.category = 'Front End'
            AND (d.skill_code & s.code) > 0
    )
ORDER BY
    d.id ASC;
