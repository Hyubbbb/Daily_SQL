-- https://school.programmers.co.kr/learn/courses/30/lessons/133027
WITH combined AS (
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
FROM combined
GROUP BY flavor
ORDER BY SUM(total_order) DESC
LIMIT 3;