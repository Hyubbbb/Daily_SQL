SELECT
    p.product_code,
    SUM(p.price * of.sales_amount) AS sales
FROM product AS p
    JOIN offline_sale AS of
        ON p.product_id = of.product_id
GROUP BY p.product_code
ORDER BY sales DESC, p.product_code;
