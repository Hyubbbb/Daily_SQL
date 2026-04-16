WITH skill_mask AS (
    SELECT 
        SUM(CASE 
                WHEN category = 'Front End' THEN code 
                ELSE 0 END) AS f_mask,
        MAX(CASE 
                WHEN name = 'Python' THEN code 
                ELSE 0 END) AS p_mask,
        MAX(CASE 
                WHEN name = 'C#' THEN code 
            ELSE 0 END) AS c_mask
    FROM skillcodes
)

SELECT 
    CASE 
        WHEN (d.skill_code & s.f_mask > 0) AND (d.skill_code & s.p_mask > 0) THEN 'A'
        WHEN (d.skill_code & s.c_mask > 0) THEN 'B'
        WHEN (d.skill_code & s.f_mask > 0) THEN 'C'
    END AS grade,
    d.id,
    d.email
FROM developers AS d
    CROSS JOIN skill_mask AS s
WHERE 1=1
    AND (d.skill_code & s.f_mask > 0) OR (d.skill_code & s.c_mask > 0)
ORDER BY grade, d.id;
