-- (https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true)

WITH RECURSIVE cte_count
AS (
        SELECT N, 1 AS GEN
        FROM BST
        WHERE P IS NULL
    
        UNION ALL
    
        SELECT a.N, cte_count.GEN+1
        FROM BST as a
        JOIN cte_count
        ON cte_count.N = a.P
)


SELECT N, 
CASE WHEN GEN = 1 THEN 'Root'
WHEN GEN = (SELECT MAX(GEN) FROM cte_count) THEN 'Leaf'
ELSE 'Inner'
END AS V

FROM cte_count
ORDER BY N;
