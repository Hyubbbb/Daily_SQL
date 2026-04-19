WITH dev_skill AS(
    SELECT 
        d.id,
        GROUP_CONCAT(s.name) AS name,
        GROUP_CONCAT(s.category) AS category
    FROM developers AS d
        JOIN skillcodes AS s
            ON d.skill_code & s.code = s.code
    GROUP BY d.id
)

SELECT
    CASE
        WHEN ds.category LIKE '%Front End%' AND ds.name LIKE '%Python%' THEN 'A'
        WHEN ds.name LIKE '%C#%' THEN 'B'
        WHEN ds.category LIKE '%Front End%' THEN 'C'
    END AS grade,
    ds.id,
    d.email
FROM dev_skill AS ds
    JOIN developers AS d
        ON ds.id = d.id
HAVING grade IS NOT NULL
ORDER BY grade, d.id;
