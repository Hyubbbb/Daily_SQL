WITH max_price_by_category AS (
  SELECT
    fp.category AS category,
    MAX(fp.price) AS max_price
  FROM food_product AS fp
  WHERE 1=1
    AND fp.category IN ('과자', '국', '김치', '식용유')
  GROUP BY fp.category
)

SELECT
  mp.category AS category,
  mp.max_price AS max_price,
  fp.product_name AS product_name
FROM max_price_by_category AS mp
  INNER JOIN food_product AS fp
    ON mp.category = fp.category
    AND mp.max_price = fp.price
WHERE 1=1
ORDER BY max_price DESC;
