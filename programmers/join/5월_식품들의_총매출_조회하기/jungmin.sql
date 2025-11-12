-- 5월 식품들의 총매출 조회하기 (박정민)
WITH total_amount AS(
    SELECT 
        product_id,
        SUM(amount) AS total_amount
    FROM food_order
    WHERE 1=1
        AND produce_date BETWEEN '2022-05-01' AND '2022-05-31'
    GROUP BY product_id
) 
SELECT
    f.product_id,
    f.product_name,
    f.price * t.total_amount AS total_sales
FROM food_product AS f
    JOIN total_amount AS t
        ON f.product_id = t.product_id
ORDER BY total_sales DESC, f.product_id ASC;
