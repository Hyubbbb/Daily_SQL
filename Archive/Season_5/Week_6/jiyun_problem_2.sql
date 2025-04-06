SELECT 
    strftime('%Y-%m-%d', order_delivered_carrier_date) AS delivered_carrier_date
    , COUNT(*) AS orders
FROM olist_orders_dataset
WHERE 
  order_delivered_carrier_date LIKE '2017-01%'
  AND order_delivered_customer_date IS NULL
GROUP BY delivered_carrier_date
ORDER BY delivered_carrier_date
