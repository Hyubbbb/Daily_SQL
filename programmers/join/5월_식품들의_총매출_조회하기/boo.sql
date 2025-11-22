SELECT
    f1.product_id,
    f1.product_name,
    SUM(f1.price * f2.amount) AS total_sales
FROM food_product AS f1
    JOIN food_order AS f2
        ON f1.product_id = f2.product_id
WHERE 1=1
    AND f2.produce_date BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY f1.product_id, f1.product_name
ORDER BY
    total_sales DESC,
    f1.product_id ASC;
