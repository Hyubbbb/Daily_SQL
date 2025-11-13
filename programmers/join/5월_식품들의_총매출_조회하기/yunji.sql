WITH order_2022_05 AS (
    SELECT product_id,
        amount, 
        produce_date
    FROM food_order
    WHERE produce_date 
        BETWEEN '2022-05-01' 
        AND '2022-05-31'
)

SELECT p.product_id,
    p.product_name,
    SUM(p.price * o.amount) AS total_sales    
FROM food_product p
JOIN order_2022_05 o
    ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC,
    p.product_id
