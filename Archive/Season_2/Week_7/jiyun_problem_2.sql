WITH RECURSIVE cte(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM cte
    WHERE n < 20)
    
SELECT REPEAT('* ', n)
FROM cte
