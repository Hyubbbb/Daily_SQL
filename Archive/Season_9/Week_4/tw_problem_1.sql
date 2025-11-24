SELECT
  seller_id,
  COUNT(DISTINCT(order_id)) AS orders
FROM olist_order_items_dataset
WHERE price >= 50.0
GROUP BY seller_id
HAVING COUNT(DISTINCT(order_id)) >= 100
ORDER BY orders DESC
