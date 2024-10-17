-- https://school.programmers.co.kr/learn/courses/30/lessons/59413
-- Requires a recursive CTE to generate a list of hours from 0 to 23

WITH RECURSIVE CTE(n) AS (
    SELECT 0
    UNION ALL
    SELECT n + 1 FROM CTE WHERE n < 23
)

SELECT
    CTE.n AS HOUR,
    IFNULL(COUNT(AO.ANIMAL_ID), 0) AS COUNT
FROM CTE
LEFT JOIN ANIMAL_OUTS AO
ON CTE.n = HOUR(AO.DATETIME)
GROUP BY CTE.n
ORDER BY CTE.n;