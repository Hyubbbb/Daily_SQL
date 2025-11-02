WITH july_order AS (
    SELECT 
        *,
        SUM(total_order) AS total_order_sum
    FROM july
    GROUP BY flavor
)

SELECT 
    f.flavor
FROM first_half AS f
    JOIN july_order AS j
    ON f.shipment_id = j.shipment_id
ORDER BY f.total_order + j.total_order_sum DESC
LIMIT 3;
