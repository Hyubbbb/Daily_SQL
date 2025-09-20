-- https://school.programmers.co.kr/learn/courses/30/lessons/301649
SELECT 
    ID,
    CASE 
        WHEN rnk <= cnt * 0.25 THEN 'CRITICAL'
        WHEN rnk <= cnt * 0.5 THEN 'HIGH'
        WHEN rnk <= cnt * 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM (
    SELECT 
        ID,
        RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS rnk,
        COUNT(*) OVER () AS cnt
    FROM ECOLI_DATA
) ranked
ORDER BY ID ASC;