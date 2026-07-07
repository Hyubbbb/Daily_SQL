-- https://solvesql.com/problems/ratio-of-gifts/
WITH gift AS (
    SELECT COUNT(*) AS gift_cnt
    FROM artworks
    WHERE 1=1
        AND LOWER(credit) LIKE '%gift%'
),
total AS (
    SELECT COUNT(*) AS total_cnt
    FROM artworks
)
SELECT ROUND(g.gift_cnt / t.total_cnt * 100, 3) AS ratio
FROM gift AS g
    JOIN total AS t
