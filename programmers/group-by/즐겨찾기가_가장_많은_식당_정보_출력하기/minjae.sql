WITH max_favorites AS (
    SELECT
        food_type,
        MAX(favorites) AS max_fav
    FROM rest_info
    GROUP BY food_type
)

SELECT
    info.food_type,
    info.rest_id,
    info.rest_name,
    info.favorites
FROM rest_info AS info
    INNER JOIN max_favorites AS max_fav_dt
        ON info.food_type = max_fav_dt.food_type
            AND info.favorites = max_fav_dt.max_fav
ORDER BY info.food_type DESC;