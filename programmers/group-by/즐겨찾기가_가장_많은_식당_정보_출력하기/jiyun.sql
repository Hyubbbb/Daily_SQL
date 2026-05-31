WITH most_favor AS (
    SELECT
        food_type,
        MAX(favorites) AS favorites
    FROM rest_info
    GROUP BY food_type
)

SELECT 
    rest.food_type,
    rest.rest_id,
    rest.rest_name,
    rest.favorites
FROM rest_info rest
    INNER JOIN most_favor favor
        ON rest.food_type = favor.food_type
            AND rest.favorites = favor.favorites
ORDER BY rest.food_type DESC
