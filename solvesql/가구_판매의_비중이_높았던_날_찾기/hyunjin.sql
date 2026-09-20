WITH summary AS (
    SELECT 
        order_date,
        COUNT(DISTINCT order_id) AS total_cnt,
        COUNT(DISTINCT CASE 
                           WHEN category = 'Furniture' 
                               THEN 1 
                       END) AS furniture
    FROM records
    GROUP BY order_date
)

SELECT
    order_date,
    furniture,
    ROUND(furniture * 100.0 / total_cnt, 2) AS furniture_pct
FROM summary
WHERE 1=1
    AND total_cnt >= 10
    AND (furniture * 100.0 / total_cnt) >= 40
ORDER BY furniture_pct DESC, order_date ASC
