SELECT customer_id
FROM (
    SELECT
        customer_id,
        product_key,
        COUNT(DISTINCT product_key) AS buy_cnt,
        (SELECT COUNT(*) FROM Product) AS cnt
    FROM Customer
    GROUP BY customer_id HAVING buy_cnt = cnt
) CNT_T
