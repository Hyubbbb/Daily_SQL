-- https://solvesql.com/problems/shipment-in-bermuda/
SELECT
    DATE(order_delivered_carrier_date) AS delivered_carrier_date,
    COUNT(order_id) AS orders
FROM olist_orders_dataset
WHERE 1=1
    AND order_delivered_carrier_date >= '2017-01-01 00:00:00'
    AND order_delivered_carrier_date < '2017-02-01 00:00:00'
    AND order_delivered_customer_date IS NULL
GROUP BY DATE(order_delivered_carrier_date)
ORDER BY delivered_carrier_date;
