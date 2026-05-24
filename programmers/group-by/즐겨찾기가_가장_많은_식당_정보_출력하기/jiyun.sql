WITH most_favor AS (
    SELECT
        food_type,
        MAX(favorites) AS favorites
    FROM rest_info
    GROUP BY food_type
)

SELECT 
    ri.food_type,
    ri.rest_id,
    ri.rest_name,
    ri.favorites
FROM rest_info ri
    INNER JOIN most_favor mf
        ON ri.food_type = mf.food_type
        AND ri.favorites = mf.favorites
ORDER BY ri.food_type DESC
