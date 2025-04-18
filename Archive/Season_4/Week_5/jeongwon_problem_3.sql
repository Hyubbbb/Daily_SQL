-- JOIN: 상품 별 오프라인 매출 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131533

SELECT 
    P.PRODUCT_CODE, 
    SUM(P.PRICE * S.SALES_AMOUNT) AS SALES
FROM PRODUCT P
JOIN OFFLINE_SALE S ON P.PRODUCT_ID = S.PRODUCT_ID
GROUP BY P.PRODUCT_CODE
ORDER BY SALES DESC, P.PRODUCT_CODE ASC;
