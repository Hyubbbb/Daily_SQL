SELECT
    customer_id,
    COUNT(customer_id) AS count_no_trans
FROM visits v
    LEFT JOIN transactions t
        ON t.visit_id = v.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id
