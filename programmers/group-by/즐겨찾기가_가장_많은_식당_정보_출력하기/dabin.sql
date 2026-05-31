WITH max_favorites_by_food_type AS (
    SELECT
        food_type,
        MAX(favorites) AS max_favorites
    FROM rest_info
    GROUP BY food_type
)

SELECT
    ri.food_type,
    ri.rest_id,
    ri.rest_name,
    ri.favorites
FROM rest_info AS ri
INNER JOIN max_favorites_by_food_type AS mf
    ON ri.food_type = mf.food_type
        AND ri.favorites = mf.max_favorites
ORDER BY ri.food_type DESC
