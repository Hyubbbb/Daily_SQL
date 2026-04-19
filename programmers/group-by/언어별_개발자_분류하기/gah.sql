WITH skill AS (
    SELECT
        MAX(CASE WHEN name = 'Python' THEN CODE END) AS python,
        MAX(CASE WHEN name = 'C#' THEN CODE END) AS csharp,
        SUM(CASE WHEN category = 'Front End' THEN CODE ELSE 0 END) AS frontend
    FROM skillcodes
)

SELECT
    CASE WHEN (d.skill_code & s.frontend) > 0 
            AND (d.skill_code & s.python) > 0 THEN 'A'
         WHEN (d.skill_code & s.csharp) > 0 THEN 'B'
         WHEN (d.skill_code & s.frontend) > 0 THEN 'C'
    END AS grade,
    d.id,
    d.email
FROM developers AS d
    CROSS JOIN skill AS s
WHERE 1=1
    AND (d.skill_code & s.frontend) > 0
    OR (d.skill_code & s.csharp) > 0
ORDER BY grade, id;
