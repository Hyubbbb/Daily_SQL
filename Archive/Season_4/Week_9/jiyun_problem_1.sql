SELECT 
  STRFTIME('%Y-%m-%d', order_purchase_timestamp) AS purchase_date
  ,COUNT(CASE WHEN order_estimated_delivery_date >= order_delivered_customer_date THEN 1 END) AS success
  ,COUNT(CASE WHEN order_estimated_delivery_date < order_delivered_customer_date THEN 1 END) AS fail 
FROM olist_orders_dataset
WHERE purchase_date LIKE '2017-01%'
GROUP BY purchase_date
ORDER BY purchase_date
