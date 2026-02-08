SELECT 
    product_code,
    SUM(price * sales_amount) AS sales
FROM offline_sale AS os
    JOIN product AS P 
        ON os.product_id = p.product_id
GROUP BY os.product_id
ORDER BY sales DESC, product_code;
