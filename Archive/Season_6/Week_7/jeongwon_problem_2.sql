-- 멸종위기의 대장균 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/301651

WITH RECURSIVE gen_cte AS (
  SELECT ID, 1 AS generation
  FROM ECOLI_DATA
  WHERE PARENT_ID IS NULL
  UNION ALL
  SELECT
    e.ID,
    g.generation + 1
  FROM ECOLI_DATA e
  JOIN gen_cte g
    ON e.PARENT_ID = g.ID
)
SELECT
  COUNT(*)       AS COUNT,
  generation     AS GENERATION
FROM gen_cte g
WHERE NOT EXISTS (
  SELECT 1
  FROM ECOLI_DATA c
  WHERE c.PARENT_ID = g.ID
)
GROUP BY generation
ORDER BY generation;
