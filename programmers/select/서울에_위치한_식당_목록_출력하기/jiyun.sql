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


## fix 후
# WHERE 1=1: 미사용
# `WHERE address LIKE` - 테이블 prefix 누락 (r1.address 필요)
# CTE는 좋은 시도지만 이 경우엔 복잡도만 증가하게 되는 것 같습니다 (개인적 생각)
    
SELECT 
    r1.rest_id,
    r1.rest_name,
    r1.food_type,
    r1.favorites,
    r1.address,
    ROUND(AVG(review_score), 2) AS score
FROM rest_info r1
    JOIN rest_review r2
        ON r1.rest_id = r2.rest_id
WHERE 1=1
    AND r1.address LIKE '서울%'
GROUP BY r1.rest_id
ORDER BY 6 DESC, 4 DESC
