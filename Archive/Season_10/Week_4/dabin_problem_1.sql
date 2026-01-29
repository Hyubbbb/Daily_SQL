-- 서울에 위치한 식당 목록 출력하기 (윤다빈)
SELECT 
    ri.rest_id,
    ri.rest_name,
    ri.food_type,
    ri.favorites,
    ri.address,
    ROUND(AVG(rr.review_score),2) AS score
FROM rest_info AS ri
INNER JOIN rest_review AS rr
    ON ri.rest_id = rr.rest_id
WHERE ri.address LIKE '서울%'
GROUP BY 
    ri.rest_id,
    ri.rest_name,
    ri.favorites,
    ri.address
ORDER BY 
    score DESC,
    ri.favorites DESC;
