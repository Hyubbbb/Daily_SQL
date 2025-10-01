-- 오프라인/온라인 판매 데이터 통합하기 (박정민)
WITH a AS (
    SELECT
        sales_date,
        product_id,
        user_id,
        sales_amount
    FROM online_sale
    WHERE MONTH(sales_date) = 3
    
    UNION ALL
    
    SELECT
        sales_date,
        product_id,
        NULL AS user_id,
        sales_amount
    FROM offline_sale
    WHERE MONTH(sales_date) = 3
) 

SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date,
    product_id,
    user_id,
    sales_amount
FROM a
ORDER BY
    sales_date ASC,
    product_id ASC,
    user_id ASC
