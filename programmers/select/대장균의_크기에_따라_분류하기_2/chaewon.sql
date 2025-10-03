-- https://school.programmers.co.kr/learn/courses/30/lessons/301649
WITH ranked AS (
    SELECT 
        id,
        RANK() OVER (ORDER BY size_of_colony DESC) AS rnk,
        COUNT(*) OVER () AS cnt
    FROM ecoli_data
)
SELECT 
    id,
    CASE 
        WHEN rnk <= cnt * 0.25 THEN 'CRITICAL'
        WHEN rnk <= cnt * 0.5 THEN 'HIGH'
        WHEN rnk <= cnt * 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS colony_name
FROM ranked
ORDER BY id ASC;