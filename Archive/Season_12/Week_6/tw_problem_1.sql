SELECT
  DATE_FORMAT(MIN(order_purchase_timestamp), "%Y-%m-%d") AS "first_order_date",
  DATE_FORMAT(MAX(order_purchase_timestamp), "%Y-%m-%d") AS "last_order_date"
FROM olist_orders_dataset
