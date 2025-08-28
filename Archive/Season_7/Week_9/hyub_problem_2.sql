-- https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true

WITH RECURSIVE numbers AS (
  SELECT 2 AS n
  UNION ALL
  SELECT 1+n FROM numbers WHERE n<1000
)

SELECT GROUP_CONCAT(n ORDER BY n SEPARATOR '&')
FROM numbers AS n1
WHERE n <= 1000
    AND NOT EXISTS(
        SELECT 1
        FROM numbers AS n2
        WHERE 1=1
            AND n2.n <= FLOOR(SQRT(n1.n)) 
            AND MOD(n1.n, n2.n) = 0
)
