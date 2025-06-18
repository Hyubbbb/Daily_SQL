-- https://school.programmers.co.kr/learn/courses/30/lessons/131533
SELECT p.product_code, SUM(s.sales_amount)*p.price AS SALES
FROM product p
JOIN offline_sale s
    ON p.product_id = s.product_id
GROUP BY p.product_id
ORDER BY sales DESC, p.product_code
