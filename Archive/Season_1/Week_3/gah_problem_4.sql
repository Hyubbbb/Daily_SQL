-- [PROGRAMMERS] JOIN > 상품 별 오프라인 매출 구하기

SELECT p.PRODUCT_CODE, SUM(p.PRICE * s.SALES_AMOUNT) SALES
FROM PRODUCT p, OFFLINE_SALE s
WHERE p.PRODUCT_ID = s.PRODUCT_ID
GROUP BY p.PRODUCT_CODE
ORDER BY 2 DESC, 1;