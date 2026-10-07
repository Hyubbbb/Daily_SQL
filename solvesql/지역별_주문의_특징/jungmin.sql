SELECT
    Region,
    COUNT(DISTINCT CASE
                       WHEN category = 'Furniture'
                           THEN order_id
                   END) AS 'Furniture',
    COUNT(DISTINCT CASE
                       WHEN category = 'Office Supplies'
                           THEN order_id
                   END) AS 'Office Supplies',
    COUNT(DISTINCT CASE
                       WHEN category = 'Technology'
                           THEN order_id
                   END) AS 'Technology'
FROM records
GROUP BY region
ORDER BY region;
