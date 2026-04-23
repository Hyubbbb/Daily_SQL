WITH frontend AS (
    SELECT SUM(code) AS frontend
    FROM skillcodes
    WHERE 1=1
        AND category = 'front end'
),
python AS (
    SELECT code AS python
    FROM skillcodes
    WHERE 1=1
        AND name = 'python'
),
csharp AS (
    SELECT code AS csharp
    FROM skillcodes
    WHERE 1=1
        AND name = 'c#'
),
grade_table AS (
    SELECT 
        CASE
            WHEN (d.skill_code & f.frontend !=0)
                AND (d.skill_code & p.python !=0)
                THEN 'A'
            WHEN (d.skill_code & c.csharp !=0)
                THEN 'B'
            WHEN (d.skill_code & f.frontend !=0)
                THEN 'C'
        END AS grade,
        d.id,
        d.email
    FROM developers AS d
        CROSS JOIN frontend AS f
        CROSS JOIN python AS p
        CROSS JOIN csharp AS c
)

SELECT
    grade,
    id,
    email
FROM grade_table
WHERE 1=1
    AND grade IS NOT NULL
ORDER BY grade, id;
