-- https://school.programmers.co.kr/learn/courses/30/lessons/131116
-- 식품분류별 가장 비싼 식품의 정보 조회하기

SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
    AND PRICE IN (
        SELECT MAX(PRICE)
        FROM FOOD_PRODUCT
        GROUP BY CATEGORY
        )
ORDER BY MAX_PRICE DESC
-- IN 연산자를 사용하면 서브 쿼리 결과에서 여러 행과 여러 칼럼을 동시에 비교할 수 있음