-- 코드를 입력하세요
-- 1. 서울에 위치한 식당들만 필터링
-- 2. JOIN 해서 집계 결과 출력

-- - [x]  대소문자: 컬럼명/테이블명 대문자
-- [x]  WHERE 1=1: 미사용
-- [x]  CTE는 좋은 시도지만 이 경우엔 복잡도만 증가하게 되는 것 같습니다 (개인적 생각)

WITH seoul_rest AS (
    SELECT
        rest_id,
        rest_name,
        food_type,
        favorites,
        address
    FROM rest_info
    WHERE 1=1
        address LIKE '서울%'
)

SELECT
    s.rest_id,
    s.rest_name,
    s.food_type,
    s.favorites,
    s.address,
    ROUND(AVG(r.review_score), 2) AS 'SCORE'
FROM seoul_rest s
  JOIN rest_review r
    USING(rest_id)
GROUP BY s.rest_id
ORDER BY 6 DESC, 4 DESC


-- CTE 사용 X
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
WHERE r1.address LIKE '서울%'
GROUP BY r1.rest_id
ORDER BY score DESC, r1.favorites DESC
