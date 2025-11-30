-- https://school.programmers.co.kr/learn/courses/30/lessons/131533

SELECT
    p.product_code         AS product_code,
    SUM(p.price * os.sales_amount) AS sales
FROM product AS p
JOIN offline_sale AS os
    ON os.product_id = p.product_id
WHERE 1=1
GROUP BY
    p.product_code
ORDER BY
    sales DESC,
    p.product_code ASC;
