WITH t1 AS (
    SELECT 
        id,
        size_of_colony,
        PERCENT_RANK() OVER (ORDER BY size_of_colony DESC) AS size_percent
    FROM ecoli_data
)

SELECT
    id,
    CASE
        WHEN size_percent BETWEEN 0 AND 0.25 THEN 'CRITICAL'
        WHEN size_percent > 0.25 AND SIZE_PERCENT <= 0.50 THEN 'HIGH'
        WHEN size_percent > 0.50 AND SIZE_PERCENT <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS colony_name
FROM t1
ORDER BY id
