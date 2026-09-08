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
    tot.order_date,
    fur.fur_num AS furniture,
    ROUND(fur.fur_num * 100.0 / tot.total_num, 2) AS furniture_pct
FROM tot
    INNER JOIN fur
        ON tot.order_date = fur.order_date
WHERE 1=1
    AND fur.fur_num * 100.0 / tot.total_num >= 40
ORDER BY furniture_pct DESC, order_date;
