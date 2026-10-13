WITH cat AS (
    SELECT
        region,
        order_id,
        category
    FROM records
    GROUP BY region, order_id, category
)

SELECT
    region AS region,
    SUM(category = 'Furniture') AS furniture,
    SUM(category = 'Office Supplies') AS `office supplies`,
    SUM(category = 'Technology') AS technology
FROM cat
GROUP BY region
ORDER BY region;
