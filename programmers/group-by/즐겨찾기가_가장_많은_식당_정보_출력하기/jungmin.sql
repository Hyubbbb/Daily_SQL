WITH max_fav AS (
    SELECT
        food_type,
        MAX(favorites) AS max_fav
    FROM rest_info
    GROUP BY food_type
)

SELECT 
    rest.food_type, 
    rest.rest_id, 
    rest.rest_name, 
    rest.favorites
FROM rest_info AS rest
    JOIN max_fav AS maxf
        ON rest.food_type = maxf.food_type
        AND rest.favorites = maxf.max_fav
ORDER BY rest.food_type DESC;
