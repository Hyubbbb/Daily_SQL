WITH rest_info_rank AS (
    SELECT
        food_type,
        rest_id,
        rest_name,
        favorites,
        RANK() OVER(PARTITION BY food_type ORDER BY favorites DESC) AS food_type_rank
    FROM rest_info
)
SELECT
    food_type,
    rest_id,
    rest_name,
    favorites
FROM rest_info_rank
WHERE 1=1
    AND food_type_rank = 1
ORDER BY food_type DESC