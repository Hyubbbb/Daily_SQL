SELECT payment_installments,
    COUNT(DISTINCT order_id) AS order_count,
    MIN(payment_value) AS min_value,
    MAX(payment_value) AS max_value,
    AVG(payment_value) AS avg_value
FROM olist_order_payments_dataset
WHERE payment_type = 'credit_card'
GROUP BY payment_installments
