SELECT
    f1.product_id,
    product_name,
    SUM(price*amount) AS total_sales
FROM food_product AS f1
    JOIN food_order AS f2
        ON f1.product_id = f2.product_id
WHERE 1=1
    AND DATE_FORMAT(produce_date, '%Y-%m') = '2022-05'
GROUP BY f1.product_id
ORDER BY
    total_sales DESC,
    f1.product_id;
