-- https://school.programmers.co.kr/learn/courses/30/lessons/131116

SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (SELECT CATEGORY, MAX(PRICE) AS PRICE
       FROM FOOD_PRODUCT
       GROUP BY CATEGORY) 
       AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY MAX_PRICE DESC;