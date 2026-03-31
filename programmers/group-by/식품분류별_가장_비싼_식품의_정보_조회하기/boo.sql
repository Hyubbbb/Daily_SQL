WITH rnk_price AS (
    SELECT
    fp.category,
    fp.price,
    fp.product_name,
    RANK() OVER(PARTITION BY fp.category ORDER BY fp.price DESC) AS rnk
FROM food_product AS fp
WHERE 1=1
    AND fp.category IN ('과자', '국', '김치', '식용유')
)

SELECT
    rp.category,
    rp.price,
    rp.product_name
FROM rnk_price AS rp
WHERE 1=1
    AND rp.rnk = 1
ORDER BY rp.price DESC;
