WITH total_order AS (
    SELECT
        flavor,
        total_order
    FROM first_half

    UNION ALL 

    SELECT
        flavor,
        total_order
    FROM july
)

SELECT 
    flavor
FROM total_order
GROUP BY flavor
ORDER BY SUM(total_order) DESC
LIMIT 3;