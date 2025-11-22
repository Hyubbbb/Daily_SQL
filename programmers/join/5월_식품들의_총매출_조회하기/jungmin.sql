-- 5월 식품들의 총매출 조회하기 (박정민)
SELECT
    f1.product_id,
    f1.product_name,
    SUM(f1.price * f2.amount) AS total_price
FROM food_product AS f1
    JOIN food_order AS f2
        ON f1.product_id = f2.product_id
WHERE 1=1
    AND f2.produce_date BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY f1.product_id
ORDER BY total_price DESC, f1.product_id ASC;
        
-- WITH total_amount AS(
--     SELECT 
--         product_id,
--         SUM(amount) AS total_amount
--     FROM food_order
--     WHERE 1=1
--         AND produce_date BETWEEN '2022-05-01' AND '2022-05-31'
--     GROUP BY product_id
-- ) 
-- SELECT
--     f.product_id,
--     f.product_name,
--     f.price * t.total_amount AS total_sales
-- FROM food_product AS f
--     JOIN total_amount AS t
--         ON f.product_id = t.product_id
-- ORDER BY total_sales DESC, f.product_id ASC;

