SELECT
  strftime ('%Y-%m-%d', order_purchase_timestamp) AS dt
  , SUM(payment_value) AS revenue_daily
FROM
  olist_orders_dataset ord
  JOIN olist_order_payments_dataset pay ON ord.order_id = pay.order_id
WHERE dt >= '2018-01-01'
GROUP BY dt
ORDER BY dt
