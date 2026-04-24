WITH RECURSIVE hours AS(
    SELECT 0 AS hour
    
    UNION ALL 
    
    SELECT hour + 1
    FROM hours
    WHERE 1=1
        AND hour < 23
)
SELECT
    h.hour,
    COUNT(ao.DATETIME) AS count
FROM hours AS h
    LEFT JOIN ANIMAL_OUTS AS ao
        ON h.hour = HOUR(ao.datetime)
GROUP BY h.hour
ORDER BY h.hour;
