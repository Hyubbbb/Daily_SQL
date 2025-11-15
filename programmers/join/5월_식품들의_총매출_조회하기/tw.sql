SELECT
    fp.product_id,
    fp.product_name,
    SUM(fo.amount * fp.price) AS totoal_sales
FROM FOOD_ORDER AS fo
    JOIN FOOD_PRODUCT AS fp USING(product_id)
WHERE 1=1
    AND YEAR(fo.produce_date) = 2022
    AND MONTH(fo.produce_date) = 05
GROUP BY
    fp.product_id,
    fp.product_name
ORDER BY
    totoal_sales DESC,
    fp.product_id ASC;
