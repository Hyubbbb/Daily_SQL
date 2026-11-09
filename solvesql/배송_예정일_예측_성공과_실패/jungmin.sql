SELECT
    DATE(order_purchase_timestamp) AS purchase_date,
    SUM(order_delivered_customer_date <= order_estimated_delivery_date) AS success,
    SUM(order_delivered_customer_date > order_estimated_delivery_date) AS fail
FROM olist_orders_dataset
WHERE 1=1
    AND order_purchase_timestamp >= '2017-01-01'
    AND order_purchase_timestamp < '2017-02-01'
GROUP BY purchase_date
ORDER BY purchase_date;
