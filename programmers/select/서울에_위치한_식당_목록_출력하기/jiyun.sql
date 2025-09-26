WITH review_avg AS (
    SELECT 
        rest_id,
        ROUND(AVG(review_score), 2) AS score
    FROM rest_review
    GROUP BY 1
)

SELECT 
    R1.rest_id,
    R1.rest_name,
    R1.food_type,
    R1.favorites,
    R1.address,
    R2.score
FROM rest_info R1
    JOIN review_avg R2
        ON R1.rest_id = R2.rest_id
WHERE address LIKE '서울%'
ORDER BY R2.score DESC, R1.favorites DESC
