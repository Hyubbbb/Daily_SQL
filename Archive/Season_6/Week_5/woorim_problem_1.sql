-- https://school.programmers.co.kr/learn/courses/30/lessons/131118
SELECT
    info.rest_id,
    info.rest_name,
    info.food_type,
    info.favorites,
    info.address,
    round(avg(review.review_score), 2) as score
FROM rest_info info
JOIN rest_review review
    ON info.rest_id = review.rest_id
WHERE substr(info.address, 1, 5) LIKE '서울%'
GROUP BY
    info.rest_id,
    info.rest_name,
    info.food_type,
    info.favorites,
    info.address
ORDER BY score DESC, info.favorites DESC;
