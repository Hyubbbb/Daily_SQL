SELECT
    f2.product_id,
    f2.product_name,
    SUM(fo.amount * fp.price) AS total_sales
FROM food_order AS f1
    JOIN food_product AS f2 USING(product_id)
WHERE 1=1
    AND YEAR(fo.produce_date) = 2022
    AND MONTH(fo.produce_date) = 05
GROUP BY
    f2.product_id,
    f2.product_name
ORDER BY
    totoal_sales DESC,
    f2.product_id ASC;
