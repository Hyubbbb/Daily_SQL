SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date,
    product_id,
    user_id,
    sales_amount
FROM online_sale
WHERE sales_date LIKE "2022-03%"

UNION ALL

SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date,
    product_id,
    NULL AS user_id,
    sales_amount
FROM offline_sale
WHERE sales_date LIKE "2022-03%"

ORDER BY 1, 2, 3;
