# 프로그래머스 > Group By > 식품분류별 가장 비싼 식품의 정보 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131116
# with 구문과 컨벤션 익숙해지기 위해 ..!
  
WITH max_price_item AS (
    SELECT category,
        MAX(price) AS max_price
    FROM food_product
    WHERE category IN ('과자', '국', '김치', '식용유')
    GROUP BY category
)

SELECT 
    f.category,
    m.max_price,
    f.product_name
FROM food_product f
INNER JOIN max_price_item m
    ON f.category = m.category
    AND f.price = m.max_price
GROUP BY category
ORDER BY max_price DESC;
