WITH dev_grade AS (
    SELECT
        CASE
            WHEN skill_code & (SELECT SUM(code) FROM skillcodes WHERE category = 'Front End') != 0
                AND skill_code & (SELECT code FROM skillcodes WHERE name = 'Python') != 0 THEN 'A'
            WHEN skill_code & (SELECT code FROM skillcodes WHERE name = 'C#') THEN 'B'
            WHEN skill_code & (SELECT SUM(code) FROM skillcodes WHERE category = 'Front End') != 0 THEN 'C'
        END AS grade,
        id,
        email
    FROM developers
)

SELECT
    *
FROM dev_grade
WHERE 1=1
    AND grade IS NOT NULL
ORDER BY grade, id
