WITH 
RECURSIVE 
master_hour AS (
    SELECT 0 AS hour
    
    UNION ALL
    
    SELECT hour+1
    FROM master_hour
    WHERE 1=1
        AND hour <= 22
),
master_count AS (
    SELECT
        HOUR(datetime) AS hour,
        COUNT(*) AS count
    FROM animal_outs
    GROUP BY hour
)
SELECT
    mh.hour AS hour,
    COALESCE(mc.count, 0) AS count
FROM master_hour AS mh
    LEFT JOIN master_count AS mc
        ON mh.hour = mc.hour
ORDER BY mh.hour;