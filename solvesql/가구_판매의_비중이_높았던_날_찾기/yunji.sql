WITH fur AS (
    SELECT
        order_date,
        COUNT(DISTINCT order_id) AS fur_num
    FROM records
    WHERE 1=1
        AND category = 'Furniture'
    GROUP BY order_date
), tot AS (
    SELECT
        order_date,
        COUNT(DISTINCT order_id) AS total_num
    FROM records
    GROUP BY order_date
    HAVING COUNT(DISTINCT order_id) >= 10
)

SELECT
    t.order_date,
    f.fur_num AS furniture,
    ROUND(f.fur_num * 100.0 / t.total_num, 2) AS furniture_pct
FROM tot AS t
    INNER JOIN fur AS f
        ON t.order_date = f.order_date
WHERE 1=1
    AND f.fur_num * 100.0 / t.total_num >= 40
ORDER BY furniture_pct DESC, order_date;
