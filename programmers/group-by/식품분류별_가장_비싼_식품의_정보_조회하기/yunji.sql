WITH max_price_item AS (
    SELECT 
        category,
        MAX(price) AS max_price
    FROM food_product
    WHERE category IN ('과자', '국', '김치', '식용유')
    GROUP BY category
)

SELECT 
    fp.category,
    mpi.max_price,
    fp.product_name
FROM food_product AS fp
  INNER JOIN max_price_item AS mpi
      ON fp.category = mpi.category
      AND fp.price = mpi.max_price
GROUP BY category
ORDER BY max_price DESC;
