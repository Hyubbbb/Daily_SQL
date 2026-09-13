WITH daily_counts AS (
    SELECT
        order_date,
        COUNT(DISTINCT CASE 
                          WHEN category = 'Furniture' 
                              THEN order_id 
                      END) AS furniture,
        COUNT(DISTINCT order_id) AS total_orders
    FROM records
    GROUP BY order_date
  )
SELECT
    order_date,
    furniture,
    ROUND(furniture * 100.0 / total_orders, 2) AS furniture_pct
FROM daily_counts
WHERE 1=1
    AND total_orders >= 10
    AND (furniture * 100.0 / total_orders) >= 40
ORDER BY furniture_pct DESC, order_date ASC
