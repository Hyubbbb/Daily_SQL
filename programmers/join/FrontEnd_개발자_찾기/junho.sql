SELECT DISTINCT 
    d.id,
    d.email,
    d.first_name,
    d.last_name
FROM developers AS d
    JOIN skillcodes AS s
        ON (d.skill_code & s.code) > 0
WHERE 1 = 1
    AND s.category = 'Front End'
ORDER BY d.id
