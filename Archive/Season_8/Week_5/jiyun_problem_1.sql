-- NULLIF(expression1, expression2)
  -- 동작 원리
  -- expression1 = expression2 → NULL 반환
  --expression1 ≠ expression2 → expression1 반환
SELECT
    p.product_id,
    COALESCE(
      ROUND(
        SUM(p.price * COALESCE(u.units, 0))
        / NULLIF(SUM(COALESCE(u.units, 0)), 0)
      , 2)
    , 0) AS average_price
FROM prices p
LEFT JOIN unitssold u
  ON  p.product_id = u.product_id
  AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
