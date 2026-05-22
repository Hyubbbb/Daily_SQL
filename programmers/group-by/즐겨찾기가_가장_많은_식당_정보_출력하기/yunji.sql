WITH max_favorites AS (
    SELECT
        food_type,
        MAX(favorites) AS max_favorite
    FROM rest_info
    GROUP BY food_type
)

SELECT
    ri.food_type,
    ri.rest_id,
    ri.rest_name,
    ri.favorites
FROM rest_info AS ri
    INNER JOIN max_favorites AS mf
        ON mf.max_favorite = ri.favorites
        AND ri.favorites = mf.max_favorite
GROUP BY ri.food_type
ORDER BY ri.food_type DESC;
