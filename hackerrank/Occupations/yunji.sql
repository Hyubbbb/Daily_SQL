WITH ranked AS (
    SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rn
    FROM occupations
)

SELECT
    MAX(IF(occupation = 'Doctor', name, NULL)) AS doctor,
    MAX(IF(occupation = 'Professor', name, NULL)) AS professor,
    MAX(IF(occupation = 'Singer', name, NULL)) AS singer,
    MAX(IF(occupation = 'Actor', name, NULL)) AS actor
FROM ranked
GROUP BY rn
ORDER BY rn;
