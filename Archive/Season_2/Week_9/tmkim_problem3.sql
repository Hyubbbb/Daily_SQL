SELECT PRODUCT_CODE, SUM(SALES_AMOUNT)*PRICE SALES
FROM OFFLINE_SALE S LEFT JOIN PRODUCT P ON S.PRODUCT_ID = P.PRODUCT_ID
GROUP BY PRODUCT_CODE
ORDER BY SALES DESC, PRODUCT_CODE;
