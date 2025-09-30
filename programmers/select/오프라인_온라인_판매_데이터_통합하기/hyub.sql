WITH union_table_onoff AS (
    SELECT
        sales_date,
        product_id,
        user_id,
        sales_amount
    FROM online_sale
    WHERE 1=1
        AND sales_date BETWEEN '2022-03-01' AND '2022-03-31'

    UNION ALL

    SELECT
        sales_date,
        product_id,
        NULL AS user_id,
        sales_amount
    FROM offline_sale
    WHERE 1=1
        AND sales_date BETWEEN '2022-03-01' AND '2022-03-31'
)
SELECT
    DATE_FORMAT(sales_date, "%Y-%m-%d") AS sales_date,
    product_id,
    user_id,
    sales_amount
FROM union_table_onoff
ORDER BY sales_date, product_id, user_id
