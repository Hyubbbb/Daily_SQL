SELECT
    d.id,
    d.email,
    d.first_name,
    d.last_name
FROM skillcodes AS s
    JOIN developers AS d
        ON s.code & d.skill_code != 0
WHERE 1=1
    AND s.name IN ('Python', 'C#')
ORDER BY d.id