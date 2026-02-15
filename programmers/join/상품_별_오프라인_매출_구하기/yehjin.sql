SELECT
    p.product_code,
    SUM(p.price * os.sales_amount) AS sales
FROM offline_sale AS os
    JOIN product AS p
        ON os.product_id=p.product_id
GROUP BY p.product_code
ORDER BY sales DESC, p.product_code;
