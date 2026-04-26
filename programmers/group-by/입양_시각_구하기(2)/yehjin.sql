WITH RECURSIVE hours AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1
    FROM hours
    WHERE 1=1
        AND hour < 23
)
SELECT
    h.hour,
    COUNT(ao.ANIMAL_ID) AS count
FROM hours AS h
    LEFT JOIN animal_outs AS ao
        ON HOUR(ao.DATETIME) = h.hour
GROUP BY h.hour
ORDER BY h.hour;