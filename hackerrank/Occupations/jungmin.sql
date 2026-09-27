WITH rank_tbl AS (
    SELECT
        occupation,
        name,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_id
    FROM occupations
)

SELECT
    MAX(IF(occupation = 'Doctor', name, NULL)) AS doctor,
    MAX(IF(occupation = 'Professor', name, NULL)) AS professor,
    MAX(IF(occupation = 'Singer', name, NULL)) AS singer,
    MAX(IF(occupation = 'Actor', name, NULL)) AS actor
FROM rank_tbl
GROUP BY row_id
ORDER BY row_id;
