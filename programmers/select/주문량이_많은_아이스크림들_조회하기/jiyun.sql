-- WITH july_order AS (
--     SELECT
--         flavor,
--         SUM(total_order) AS total_order
--     FROM july
--     GROUP BY flavor
-- )
    
-- SELECT f.flavor
-- FROM first_half AS f
--     LEFT JOIN july_order AS j
--         ON f.flavor = j.flavor
-- ORDER BY f.total_order + j.total_order DESC
-- LIMIT 3

-- 🤔 다른 test case에서는 LEFT JOIN이 통과되지 않을 수도 있겠다

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
