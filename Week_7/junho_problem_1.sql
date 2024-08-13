-- (https://school.programmers.co.kr/learn/courses/30/lessons/131530, Lv.2)

SELECT 10000 * (PRICE DIV 10000) AS PRICE_GROUP, COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY 1
ORDER BY 1;
