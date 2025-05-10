-- https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50

-- 1. Find First order
WITH Min_table AS (
    SELECT 
        customer_id
        , min(order_date) AS order_date
    FROM Delivery
    GROUP BY customer_id)

-- 2. Calcuate Immediate Percentage
SELECT
      ROUND(
      AVG(CASE 
          WHEN d.order_date = d.customer_pref_delivery_date THEN 100
          ELSE 0 END), 2) AS immediate_percentage

FROM Delivery AS d
JOIN Min_table AS m
    on d.customer_id = m.customer_id
        AND d.order_date = m.order_date

-- 개선 사항
    -- 1. JOIN 대신, 
        -- ROW_NUMBER()를 사용하면 최소값 찾기 더 깔끔하다.
    -- 2. CASE WHEN 대신, 
        -- AVG(Boolean)을 사용하면 쿼리가 더 직관적이다
