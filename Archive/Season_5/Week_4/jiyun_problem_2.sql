SELECT 
  strftime('%Y-%m-%d',order_purchase_timestamp) AS dt
  ,COUNT(DISTINCT customer_id) AS pu
  ,ROUND(SUM(payment_value),2) AS revenue_daily
  ,ROUND(SUM(payment_value)/COUNT(DISTINCT customer_id),2) AS arppu
FROM olist_orders_dataset ord
  JOIN olist_order_payments_dataset pay ON ord.order_id = pay.order_id
WHERE order_purchase_timestamp >= '2018-01-01'
GROUP BY strftime('%Y-%m-%d',order_purchase_timestamp)
ORDER BY dt
