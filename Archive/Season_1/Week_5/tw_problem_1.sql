-- 가격이 제일 비싼 식품의 정보 출력하기(programmers)
-- SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, MAX(PRICE) AS PRICE
-- FROM FOOD_PRODUCT

-- 그냥 위에처럼 곧바로 조회하면 안되고, 위 코드를 서브쿼리에 담아서 조회해야 알맞게 나온다
-- 이유는? 이유는 MAX(price) 함수를 직접 SELECT 절에 사용할 경우, 다른 열들의 값을 제대로 얻을 수 없음
-- 직접적인 MAX(price) 사용은 해당 열의 값만을 가져오며, 그 외의 다른 열들은 정확히 매칭되지 않을 수 기 때문

SELECT * 
FROM FOOD_PRODUCT
WHERE price = (SELECT MAX(price) FROM FOOD_PRODUCT)
