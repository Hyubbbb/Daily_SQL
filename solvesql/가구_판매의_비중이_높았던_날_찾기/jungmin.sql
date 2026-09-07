WITH cnt_tbl AS (
    SELECT
        order_date,
        COUNT(DISTINCT order_id) AS cnt_order,
        COUNT(DISTINCT CASE
                           WHEN category = 'Furniture'
                               THEN order_id
                       END) AS furniture
    FROM records
    GROUP BY order_date
)
SELECT
    order_date,
    furniture,
    ROUND(furniture / cnt_order * 100.0, 2) AS furniture_pct
FROM cnt_tbl
WHERE 1=1
    AND cnt_order >= 10
    AND furniture / cnt_order * 100.0 >= 40
ORDER BY furniture_pct DESC, order_date;
