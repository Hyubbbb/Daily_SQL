WITH RECURSIVE hour_base AS (
    SELECT 0 AS hour

    UNION ALL
    
    SELECT hour + 1
    FROM hour_base
    WHERE 1=1
        AND hour < 23
)

SELECT
    hb.hour,
    COUNT(ao.animal_id) AS count
FROM hour_base AS hb
    LEFT JOIN animal_outs AS ao
        ON hb.hour = hour(ao.datetime)
GROUP BY hb.hour
ORDER BY hb.hour
