-- (https://school.programmers.co.kr/learn/courses/30/lessons/131116, Lv.4)

-- 풀이 1 (서브 쿼리 활용)
SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (SELECT CATEGORY, MAX(PRICE)
                                FROM FOOD_PRODUCT
                                WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
                                GROUP BY CATEGORY)                                
GROUP BY CATEGORY, PRODUCT_NAME
ORDER BY MAX_PRICE DESC;

-- 풀이 2 (rank() 함수 활용)
SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM (SELECT CATEGORY, RANK() over (PARTITION BY CATEGORY order by PRICE desc) AS RANKING, PRICE, PRODUCT_NAME
        FROM FOOD_PRODUCT) r
WHERE RANKING = 1 AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY MAX_PRICE DESC;
