SELECT ord.order_month,
      ordered_amount,
      canceled_amount,
      ordered_amount+canceled_amount AS total_amount
FROM (SELECT strftime('%Y-%m', order_date) AS order_month,
            SUM(price*quantity) AS ordered_amount
      FROM orders O JOIN order_items I ON O.order_id = I.order_id
      WHERE O.order_id NOT LIKE 'C%'
      GROUP BY order_month) ord
JOIN (SELECT strftime('%Y-%m', order_date) AS order_month, 
            SUM(price*quantity) AS canceled_amount
      FROM orders O JOIN order_items I ON O.order_id = I.order_id
      WHERE O.order_id LIKE 'C%'
      GROUP BY order_month) cancel
ON ord.order_month = cancel.order_month
