SELECT 
    p.product_code,
    SUM(os.sales_amount) * p.price AS sales
FROM product AS p
    JOIN offline_sale AS os
        ON p.product_id = os.product_id
ORDER BY sales DESC, product_id;
