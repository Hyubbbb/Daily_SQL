WITH food_rk AS (
    SELECT
        category,
        price,
        product_name,
        RANK() OVER(PARTITION BY category ORDER BY price DESC) AS rk
    FROM food_product
    WHERE 1=1
        AND category IN ('과자', '국', '김치', '식용유')
)
SELECT
    category,
    price AS max_price,
    product_name
FROM food_rk
WHERE 1=1
    AND rk = 1
ORDER BY price DESC;