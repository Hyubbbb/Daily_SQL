WITH favorites_info AS (
    SELECT
        food_type,
        MAX(favorites) AS max_favorites
    FROM rest_info
    GROUP BY food_type
)

SELECT
    rest.food_type,
    rest.rest_id,
    rest.rest_name,
    rest.favorites
FROM rest_info AS rest
    JOIN favorites_info AS fav
        ON rest.favorites = fav.max_favorites
            AND rest.food_type = fav.food_type
ORDER BY rest.food_type DESC

