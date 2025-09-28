SELECT 
    ri.rest_id,
    ri.rest_name,
    ri.food_type,
    ri.favorites,
    ri.address,
    ROUND(AVG(rr.review_score), 2) AS score
FROM rest_info AS ri
    JOIN rest_review AS rr
        ON ri.rest_id = rr.rest_id
WHERE address LIKE '서울%'
GROUP BY ri.rest_id, ri.rest_name, ri.food_type, ri.favorites, ri.address
ORDER BY score DESC, favorites DESC
