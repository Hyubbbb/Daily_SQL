WITH active_products AS (
    SELECT * FROM products 
    WHERE status = 'active'
),
category_avg AS (
    SELECT 
        category,
        AVG(price) as avg_price
    FROM active_products
    GROUP BY category
)
SELECT category, avg_price
FROM category_avg
WHERE avg_price > 10000;