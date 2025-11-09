WITH merged_orders AS (
    SELECT
        f.flavor ,
        SUM(f.total_order) AS total_order
    FROM first_half AS f
    GROUP BY f.flavor

    UNION ALL

    SELECT
        j.flavor ,
        SUM(j.total_order) AS total_order
    FROM july AS j
    GROUP BY j.flavor
)
SELECT
    m.flavor
FROM merged_orders AS m
GROUP BY
    m.flavor
ORDER BY
    SUM(m.total_order) DESC ,
    m.flavor ASC
LIMIT 3;

