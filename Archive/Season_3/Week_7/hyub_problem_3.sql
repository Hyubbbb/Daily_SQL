-- https://solvesql.com/problems/max-row/

SELECT id
FROM 
  (SELECT id, MAX(x)
  FROM points

  UNION ALL

  SELECT id, MAX(y)
  FROM points)
ORDER BY id
