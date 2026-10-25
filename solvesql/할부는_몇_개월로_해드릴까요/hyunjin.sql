SELECT
    payment_installments,
    count(DISTINCT order_id) AS order_count,
    MIN(payment_value) AS min_value,
    MAX(payment_value) AS max_value,
    AVG(payment_value) AS avg_value
FROM olist_order_payments_dataset
WHERE 1=1
    AND payment_type = "credit_card"
GROUP BY payment_installments
