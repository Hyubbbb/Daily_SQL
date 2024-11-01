WITH RECURSIVE cte as (
    SELECT 20 AS row_count
    UNION ALL
    SELECT row_count -1
    FROM cte
    WHERE row_count > 1
)

SELECT REPEAT('* ', row_count)
FROM cte;
