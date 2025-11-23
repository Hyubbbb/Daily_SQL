SELECT
    fp1.product_id   AS product_id,
    fp1.product_name AS product_name,
    SUM(fo1.amount * fp1.price) AS total_sales
FROM food_product AS fp1
    JOIN food_order AS fo1
        ON fo1.product_id = fp1.product_id
WHERE 1=1
    AND fo1.produce_date BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY
    fp1.product_id,
    fp1.product_name
ORDER BY
    total_sales DESC,
    fp1.product_id ASC;
