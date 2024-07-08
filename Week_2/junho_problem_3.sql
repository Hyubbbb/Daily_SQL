-- (https://school.programmers.co.kr/learn/courses/30/lessons/301650, Lv.4)

WITH RECURSIVE cte_count
AS (
    SELECT ID, 1 AS GEN
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    
    UNION ALL
    
    SELECT a.ID, cte_count.GEN+1
    FROM ECOLI_DATA as a
    JOIN cte_count
    ON a.PARENT_ID = cte_count.ID
)

SELECT ID
FROM cte_count
WHERE GEN = 3
ORDER BY ID;
