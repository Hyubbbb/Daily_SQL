WITH review_avg AS (
    SELECT 
        rest_id,
        ROUND(AVG(review_score), 2) AS score
    FROM rest_review
    GROUP BY 1
)

SELECT 
    r1.rest_id,
    r1.rest_name,
    r1.food_type,
    r1.favorites,
    r1.address,
    r2.score
FROM rest_info r1
    JOIN review_avg r2
        ON r1.rest_id = r2.rest_id
WHERE address LIKE '서울%'
ORDER BY r2.score DESC, r1.favorites DESC
