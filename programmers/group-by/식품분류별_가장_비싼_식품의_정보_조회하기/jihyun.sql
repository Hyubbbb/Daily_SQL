# --https://school.programmers.co.kr/learn/courses/30/lessons/131116

WITH max_price AS (
    SELECT 
        category,
        MAX(price) AS max_price
    FROM food_product
    WHERE 1=1
        AND category IN ('과자', '국', '김치', '식용유')
    GROUP BY category)

SELECT 
    f.category, 
    m.max_price, 
    f.product_name
FROM food_product AS f 
    JOIN max_price AS m
        ON f.category = m.category
WHERE 1=1
    AND f.price = m.max_price
ORDER BY m.max_price DESC