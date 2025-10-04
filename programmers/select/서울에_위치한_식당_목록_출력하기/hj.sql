SELECT 
    r1.rest_id,
    r1.rest_name,
    r1.food_type,
    r1.favorites,
    r1.address,
    ROUND(AVG(r2.review_score), 2) AS score
FROM rest_info AS r1
    INNER JOIN rest_review AS r2 
        ON r1.rest_id = r2.rest_id
WHERE 
    1=1 AND
    r1.address LIKE '서울%'
GROUP BY r1.rest_id
ORDER BY score DESC, r1.favorites DESC;
