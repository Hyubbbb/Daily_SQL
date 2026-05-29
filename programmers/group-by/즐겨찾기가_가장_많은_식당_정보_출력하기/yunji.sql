WITH max_favorites AS (
    SELECT
        food_type,
        MAX(favorites) AS max_favorite
    FROM rest_info
    GROUP BY food_type
)

SELECT
    info.food_type,
    info.rest_id,
    info.rest_name,
    info.favorites
FROM rest_info AS info
    INNER JOIN max_favorites AS fav
        ON info.food_type = fav.food_type
            AND info.favorites = fav.max_favorite
ORDER BY info.food_type DESC;
