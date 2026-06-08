-- https://solvesql.com/problems/olist-daily-revenue/
SELECT
    DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m-%d') AS dt,
    ROUND(SUM(payments.payment_value), 2) AS revenue_daily
FROM olist_orders_dataset AS orders
    JOIN olist_order_payments_dataset AS payments
        ON orders.order_id = payments.order_id
WHERE 1=1
    AND orders.order_purchase_timestamp >= '2018-01-01'
GROUP BY DATE_FORMAT(orders.order_purchase_timestamp, '%Y-%m-%d')
ORDER BY dt
