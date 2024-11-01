-- https://school.programmers.co.kr/learn/courses/30/lessons/301651
-- RECURSIVE, UNION, GROUP BY

WITH RECURSIVE generations AS (
    SELECT id, 1 AS generation
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL

    UNION ALL

    SELECT e.id, g.generation + 1
    FROM ECOLI_DATA e
    JOIN generations g ON e.PARENT_ID = g.id
)
SELECT COUNT(*) AS COUNT, g.generation as GENERATION
FROM generations g
LEFT JOIN ECOLI_DATA child ON g.id = child.PARENT_ID
WHERE child.id IS NULL
GROUP BY g.generation
ORDER BY g.generation;