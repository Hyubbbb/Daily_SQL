-- https://solvesql.com/problems/olist-daily-revenue/
SELECT 
  DATE_FORMAT(order_purchase_timestamp, "%Y-%m-%d") AS 'dt',
  ROUND(SUM(payment_value), 2) AS 'revenue_daily'
FROM olist_orders_dataset o1
  JOIN olist_order_payments_dataset o2
    ON o1.order_id = o2.order_id
WHERE DATE_FORMAT(order_purchase_timestamp, "%Y-%m-%d") >= '2018-01-01'
GROUP BY 1
ORDER BY 1
