-- 프로그래머스 식품 분류별 가장 비싼 식품의 정보 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131116

SELECT F.CATEGORY, G.MAX_PRICE, F.PRODUCT_NAME 
FROM (
    -- Subquery 사용해서 GROUP BY로 MAX_PRICE 가져온다
    SELECT CATEGORY, 
        MAX(PRICE) AS MAX_PRICE
    FROM FOOD_PRODUCT
    GROUP BY CATEGORY
) AS G
-- Subquery의 MAX_PRICE와 PRICE가 동일한 row만 필터링
JOIN FOOD_PRODUCT AS F
    ON G.MAX_PRICE = F.PRICE
WHERE F.CATEGORY IN ("과자", "국", "김치", "식용유")
GROUP BY F.CATEGORY, F.PRODUCT_NAME, G.MAX_PRICE
ORDER BY MAX_PRICE DESC