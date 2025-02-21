-- https://solvesql.com/problems/estimated-delivery-date/

WITH TMP AS (
  SELECT 
    strftime('%Y-%m-%d', order_purchase_timestamp) AS purchase_date,
    CASE 
    WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1
    ELSE 0 END AS s_f
    -- SUBSTR(strftime('%Y-%m-%d', order_purchase_timestamp), 1, 7)
  FROM olist_orders_dataset AS o
  WHERE SUBSTR(strftime('%Y-%m-%d', order_purchase_timestamp), 1, 7) = '2017-01'
    AND order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL)

SELECT
  purchase_date,
  SUM(s_f) AS success,
  COUNT(s_f) - SUM(s_f) AS fail
FROM TMP
GROUP BY purchase_date
ORDER BY purchase_date
