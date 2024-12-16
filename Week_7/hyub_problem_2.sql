-- https://solvesql.com/problems/shoppingmall-monthly-summary/
-- 월 별로 취소 주문을 제외한 주문 금액의 합계, 취소 주문의 금액 합계, 그리고 총 합계를 계산

WITH total AS
  (SELECT 
    SUBSTR(order_date, 1, 7) AS order_month,
    SUM(price * quantity) AS total_amount
  FROM orders o
  JOIN order_items i
    on o.order_id = i.order_id
  GROUP BY SUBSTR(order_date, 1, 7)),

cancel AS
  (SELECT 
    SUBSTR(order_date, 1, 7) AS order_month,
    SUM(price * quantity) AS canceled_amount
  FROM orders o
  JOIN order_items i
    on o.order_id = i.order_id
  WHERE o.order_id LIKE 'C%'
  GROUP BY SUBSTR(order_date, 1, 7))

SELECT 
  t.order_month AS order_month,
  (total_amount - canceled_amount) AS ordered_amount,
  canceled_amount,
  total_amount
FROM total t
JOIN cancel c
  on t.order_month = c.order_month
ORDER BY t.order_month
