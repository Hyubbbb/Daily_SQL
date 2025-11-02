WITH total AS (
SELECT 
    flavor, 
    SUM(total_order) AS total_order
FROM first_half
GROUP BY flavor

UNION ALL

SELECT 
    flavor, 
    SUM(total_order) AS total_order
FROM july
GROUP BY flavor
)
SELECT flavor
FROM total
GROUP BY flavor
ORDER BY SUM(total_order) DESC
LIMIT 3;
