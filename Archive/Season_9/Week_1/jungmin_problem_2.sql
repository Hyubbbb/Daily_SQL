-- programmers (String, Date) : 카테고리 별 상품 개수 구하기 (LEVEL 2)
SELECT
    LEFT(product_code, 2) AS category,
    COUNT(product_id) AS products
FROM product
GROUP BY category
ORDER BY category ASC;
