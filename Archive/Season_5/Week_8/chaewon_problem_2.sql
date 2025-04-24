-- ROW_NUMBER로 주문에 순차적 번호 부여여
SELECT
    user_id, order_id, amount, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date) AS order_rank, SUM(amount) OVER (PARTITION BY user_id ORDER BY order_date) AS cumulative_amount
FROM orders;