WITH records_daily AS (
    SELECT
        order_date,
        COUNT(DISTINCT order_id) AS cnt_total,
        COUNT(DISTINCT IF(category = 'Furniture', order_id, NULL)) AS cnt_furniture
    FROM records
    GROUP BY order_date
)
SELECT
    order_date,
    cnt_furniture AS furniture,
    ROUND(100 * cnt_furniture / cnt_total, 2) AS furniture_pct
FROM records_daily
WHERE 1=1
    AND cnt_total >= 10
    AND cnt_furniture / cnt_total >= 0.4
ORDER BY furniture_pct DESC, order_date;