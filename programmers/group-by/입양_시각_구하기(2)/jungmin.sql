WITH RECURSIVE hours_table AS (
    SELECT 0 AS hour
    
    UNION ALL
    
    SELECT hour + 1
    FROM hours_table
    WHERE 1=1
        AND hour <= 22
)

SELECT 
    ht.hour, 
    COUNT(ao.animal_id) AS count
FROM hours_table AS ht
    LEFT JOIN animal_outs AS ao
        ON ht.hour = HOUR(ao.datetime)
GROUP BY ht.hour
ORDER BY ht.hour;
