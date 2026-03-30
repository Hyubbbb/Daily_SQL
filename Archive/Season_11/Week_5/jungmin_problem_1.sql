-- https://solvesql.com/problems/first-and-last-orders/
SELECT
    MIN(DATE_FORMAT(order_purchase_timestamp, '%Y-%m-%d')) AS first_order_date,
    MAX(DATE_FORMAT(order_purchase_timestamp, '%Y-%m-%d')) AS last_order_date
FROM olist_orders_dataset
