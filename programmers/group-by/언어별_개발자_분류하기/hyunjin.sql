WITH graded AS (
    SELECT 
        CASE 
            WHEN (skill_code & (SELECT SUM(s.code) FROM skillcodes WHERE category = 'Front End')) 
                 AND (skill_code & (SELECT code FROM skillcodes WHERE name = 'Python')) 
                 THEN 'A'
            WHEN (skill_code & (SELECT code FROM skillcodes WHERE name = 'C#')) 
                 THEN 'B'
            WHEN (skill_code & (SELECT SUM(code) FROM skillcodes WHERE category = 'Front End')) 
                 THEN 'C'
            ELSE NULL 
        END AS 
        grade,
        id, 
        email
    FROM developers
)

SELECT 
   g.grade,
   g.id,
   g.email
FROM graded AS g
WHERE 1=1
  AND g.grade IS NOT NULL
ORDER BY g.grade, g.id
