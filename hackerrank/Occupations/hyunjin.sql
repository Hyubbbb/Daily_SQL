WITH ranked AS (
    SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rn
    FROM occupations
)
SELECT
    MAX(CASE 
            WHEN occupation = 'Doctor' 
                THEN name 
        END) AS doctor,
    MAX(CASE 
            WHEN occupation = 'Professor' 
                THEN name 
        END) AS professor,
    MAX(CASE 
            WHEN occupation = 'Singer' 
                THEN name 
        END) AS singer,
    MAX(CASE 
            WHEN occupation = 'Actor' 
                THEN name 
        END) AS actor
FROM ranked
GROUP BY rn
ORDER BY rn;
