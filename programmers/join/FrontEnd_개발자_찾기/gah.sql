SELECT DISTINCT
    d.id,
    d.email,
    e.first_name,
    d.last_name
FROM developers AS d
    JOIN skillcodes AS s
        ON d.skill_code & s.code > 0
WHERE s.category = 'Front End'
ORDER BY d.id;
