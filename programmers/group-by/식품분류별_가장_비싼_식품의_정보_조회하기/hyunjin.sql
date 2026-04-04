-- 코드를 입력하세요
WITH max_category AS (
   SELECT 
      fp.category,
      MAX(fp.price) AS max_price
   FROM food_product AS fp
   GROUP BY fp.category
)

SELECT 
   mc.category,
   mc.max_price,
   fp.product_name
FROM max_category AS mc
  JOIN food_product AS fp
     ON mc.category = fp.category
     AND mc.max_price = fp.price
WHERE 1=1
  AND fp.category IN ('과자', '국', '김치', '식용유')
ORDER BY max_price DESC



