SELECT
    DATE(order_purchase_timestamp) AS purchase_date,
    COUNT(CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1 END) AS success,
    COUNT(CASE WHEN order_delivered_customer_date >  order_estimated_delivery_date THEN 1 END) AS fail
FROM olist_orders_dataset
WHERE 1=1
    AND order_purchase_timestamp >= '2017-01-01'
    AND order_purchase_timestamp <  '2017-02-01'
    AND order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL
GROUP BY DATE(order_purchase_timestamp)
ORDER BY purchase_date;
