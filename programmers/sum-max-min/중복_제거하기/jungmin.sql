SELECT COUNT(DISTINCT name) AS count
FROM animal_ins
WHERE 1=1
    AND name IS NOT NULL
    
-- WITH unique_names AS (
--     SELECT name
--     FROM animal_ins
--     WHERE 1=1
--         AND name IS NOT NULL
--     GROUP BY name
-- )

-- SELECT COUNT(*) AS count
-- FROM unique_names;
