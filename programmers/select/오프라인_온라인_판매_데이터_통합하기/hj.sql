SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date,
    product_id,
    user_id,
    sales_amount
FROM online_sale
WHERE 
    1=1 AND
    YEAR(sales_date) = 2022 AND
    MONTH(sales_date) = 3
UNION ALL
SELECT 
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date, 
    product_id, 
    NULL AS user_id, 
    sales_amount
FROM offline_sale
WHERE 
    1=1 AND
    YEAR(sales_date) = 2022 AND
    MONTH(sales_date) = 3
ORDER BY 
    sales_date ASC, 
    product_id ASC,
    user_id ASC; 
