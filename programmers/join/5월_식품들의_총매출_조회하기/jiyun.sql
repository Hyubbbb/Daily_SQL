SELECT 
    f1.product_id,
    f2.product_name,
    SUM(f2.price * f1.amount) AS total_sales
FROM food_order f1
    JOIN food_product f2
        ON f1.product_id = f2.product_id
WHERE 1=1
    AND f1.produce_date BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY f1.product_id
ORDER BY total_sales DESC, f1.product_id
