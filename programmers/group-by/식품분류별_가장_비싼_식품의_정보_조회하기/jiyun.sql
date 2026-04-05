WITH max_price_tb AS (
    SELECT
        category,
        MAX(price) AS max_price
    FROM food_product
    WHERE 1=1
        AND category IN ('과자', '국', '김치', '식용유')
    GROUP BY category
)

SELECT
    fp.category,
    max_price,
    product_name
FROM food_product AS fp
    JOIN max_price_tb AS mp
        ON fp.category = mp.category
            AND fp.price = mp.max_price
ORDER BY max_price DESC
