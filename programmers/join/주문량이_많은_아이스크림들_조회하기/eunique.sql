WITH all_order AS (
    SELECT
        flavor,
        total_order
    FROM july
    
    UNION ALL
    
    SELECT
        flavor,
        total_order
    FROM first_half
)
    
SELECT 
    flavor
FROM all_order
GROUP BY flavor
ORDER BY SUM(total_order) DESC
LIMIT 3
