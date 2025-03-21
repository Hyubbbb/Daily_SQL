-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131117
-- FOOD_PRODUCT와 FOOD_ORDER 테이블 조인, 각 식품별 총매출(가격 * 주문량) 계산 후 집계
SELECT FP.PRODUCT_ID, FP.PRODUCT_NAME, SUM(FP.PRICE * FO.AMOUNT) AS TOTAL_SALES
FROM FOOD_PRODUCT FP JOIN FOOD_ORDER FO ON FP.PRODUCT_ID = FO.PRODUCT_ID
WHERE FO.PRODUCE_DATE BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY FP.PRODUCT_ID, FP.PRODUCT_NAME
ORDER BY TOTAL_SALES DESC, FP.PRODUCT_ID ASC;