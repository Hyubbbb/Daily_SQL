--https://solvesql.com/problems/first-and-last-orders/

SELECT
    DATE(MIN(order_purchase_timestamp)) AS first_order_date,
    DATE(MAX(order_purchase_timestamp)) AS last_order_date
FROM
    olist_orders_dataset;
