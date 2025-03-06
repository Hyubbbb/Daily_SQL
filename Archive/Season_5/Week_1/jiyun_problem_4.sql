SELECT 
  seller_id
  ,COUNT(DISTINCT order_id) AS orders
FROM olist_order_items_dataset
GROUP BY seller_id HAVING orders >= 100
