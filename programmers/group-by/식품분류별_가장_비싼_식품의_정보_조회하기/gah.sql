WITH price_rank AS (
    SELECT
        category,
        product_name,
        price,
        RANK() OVER (
            PARTITION BY category
            ORDER BY price DESC
        ) AS price_rank
    FROM food_product
    WHERE 1=1
        AND category IN ('과자', '국', '김치', '식용유')
)

SELECT
    category,
    price AS max_price,
    product_name
FROM price_rank
WHERE 1=1
    AND price_rank = 1
ORDER BY max_price DESC;
