SELECT 
    SUBSTR(product_code, 1, 2) AS category,
    COUNT(*) AS products
FROM product
GROUP BY SUBSTR(product_code, 1, 2)
ORDER BY category;
