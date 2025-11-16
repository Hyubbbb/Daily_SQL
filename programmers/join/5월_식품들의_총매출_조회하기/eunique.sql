SELECT
    fp.product_id AS product_id,
    fp.product_name AS product_name,
    SUM(fp.price * fo.amount) AS total_sales
FROM food_product fp
    JOIN food_order fo
        ON fp.product_id = fo.product_id
WHERE 1=1 
  AND fo.produce_date >= '2022-05-01'
  AND fo.produce_date <  '2022-06-01'
GROUP BY fp.product_id, fp.product_name
ORDER BY total_sales DESC, product_id ASC;
