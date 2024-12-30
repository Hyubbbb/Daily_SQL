-- https://solvesql.com/problems/first-and-last-orders/

SELECT strftime('%Y-%m-%d', MIN(order_purchase_timestamp)) AS first_order_date, strftime('%Y-%m-%d', MAX(order_purchase_timestamp))  AS last_order_date
FROM olist_orders_dataset
