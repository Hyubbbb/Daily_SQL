WITH price_rank AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) as rn
    FROM food_product
)

SELECT
    pr.category,
    pr.price AS max_price,
    pr.product_name
FROM price_rank AS pr
WHERE 1=1
    AND category IN ('과자', '국', '김치', '식용유')
    AND rn = 1
GROUP BY category
ORDER BY price DESC;