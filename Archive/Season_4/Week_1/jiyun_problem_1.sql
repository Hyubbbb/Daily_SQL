SELECT id 
FROM points tmp
JOIN (SELECT MAX(x) AS x FROM points) X
  ON tmp.x=X.x

UNION ALL

SELECT id 
FROM points tmp
JOIN (SELECT MAX(y) AS y FROM points) Y
  ON tmp.y=Y.y
ORDER BY id
