-- https://solvesql.com/problems/max-row/
SELECT id
FROM points
WHERE 1=1
    AND (x = (SELECT MAX(x) FROM points)
        OR 
        y = (SELECT MAX(y) FROM points)
    )
ORDER BY id ASC;
