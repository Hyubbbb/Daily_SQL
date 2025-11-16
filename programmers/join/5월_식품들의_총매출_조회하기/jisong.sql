SELECT
    fp.product_id   AS product_id,
    fp.product_name AS product_name,
    SUM(fo.amount * fp.price) AS total_sales
FROM food_product AS fp
    JOIN food_order AS fo
        ON fo.product_id = fp.product_id
WHERE 1=1
    AND fo.produce_date BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY
    fp.product_id,
    fp.product_name
ORDER BY
    total_sales DESC,
    fp.product_id ASC;
