WITH max_price_cte AS (
    SELECT
        category,
        MAX(price) AS max_price
    FROM food_product
    WHERE 1=1
      AND category IN ('과자', '국', '김치', '식용유')
    GROUP BY category
)
SELECT
    p.category,
    p.price AS max_price,
    p.product_name
FROM food_product p
JOIN max_price_cte m
  ON p.category = m.category
 AND p.price = m.max_price
WHERE 1=1
ORDER BY p.price DESC;
