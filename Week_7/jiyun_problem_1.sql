WITH RECURSIVE cte(n) AS (
    SELECT 20
    UNION ALL
    SELECT n - 1
    FROM cte
    WHERE n > 1)
    
SELECT REPEAT('* ', n)
FROM cte
