SELECT
    id,
    email,
    first_name,
    last_name
FROM developers
WHERE 1=1
    AND skill_code & (SELECT code FROM skillcodes WHERE name = 'Python') != 0
    OR skill_code & (SELECT code FROM skillcodes WHERE name = 'C#') != 0
ORDER BY id
