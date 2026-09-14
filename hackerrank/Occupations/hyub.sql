WITH ranked_occupations AS (
    SELECT
        name,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rnum,
        occupation
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
FROM ranked_occupations
GROUP BY rnum
ORDER BY rnum;