SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS 'sales_date',
    product_id,
    user_id,
    sales_amount
FROM online_sale
WHERE 1=1
    AND DATE_FORMAT(sales_date, '%Y-%m') = '2022-03'
UNION ALL
SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS 'sales_date',
    product_id,
    NULL,
    sales_amount
FROM offline_sale
WHERE 1=1
    AND DATE_FORMAT(sales_date, '%Y-%m') = '2022-03'
ORDER BY 1, 2, 3
 
