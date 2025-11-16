-- 코드를 입력하세요
SELECT 
    fp.product_id as product_id,
    fp.product_name as product_name,
    SUM(fp.price * fo.amount) AS total_sales
FROM food_product fp
    JOIN food_order fo
        ON fp.product_id = fo.product_id
WHERE 1=1 
    AND to_char(fo.produce_date, 'YYYY-MM') = '2022-05'
GROUP BY fp.product_id, fp.product_name
ORDER BY total_sales DESC, product_id ASC;
