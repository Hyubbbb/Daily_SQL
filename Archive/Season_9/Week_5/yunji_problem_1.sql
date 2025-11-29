# 프로그래머스 > SELECT > 서울에 위치한 식당 목록 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131118
  
WITH seoul_rest AS ( -- 서울 식당만 저장
    SELECT
        rest_id,
        rest_name,
        food_type,
        favorites,
        address
    FROM rest_info
    WHERE address LIKE '서울%' -- '%서울%'은 안되고, '서울%'만 된다..
)

SELECT 
    s.rest_id,
    s.rest_name,
    s.food_type,
    s.favorites,
    s.address,
    ROUND(AVG(r.review_score), 2) AS score
FROM rest_review AS r
    JOIN seoul_rest AS s
        ON r.rest_id = s.rest_id
GROUP BY r.rest_id
ORDER BY 
    score DESC,
    s.favorites DESC
