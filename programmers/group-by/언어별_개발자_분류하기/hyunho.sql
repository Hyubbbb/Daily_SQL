WITH user_grade AS (
    SELECT 
        CASE 
            WHEN (skill_code & (SELECT SUM(code) FROM skillcodes WHERE category = 'Front End'))
                AND (skill_code & (SELECT code FROM skillcodes WHERE name = 'Python'))
                THEN 'A'
            WHEN skill_code & (SELECT code FROM skillcodes WHERE name = 'C#')
                THEN 'B'
            WHEN skill_code & (SELECT SUM(code) FROM skillcodes WHERE category = 'Front End')
                THEN 'C'
        END AS grade,
        id,
        email
    FROM developers
)

SELECT
    grade,
    id,
    email
FROM user_grade
WHERE 1=1
    AND grade IS NOT NULL
ORDER BY grade, id;
