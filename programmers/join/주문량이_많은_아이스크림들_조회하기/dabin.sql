-- 주문량이 많은 아이스크림들 조회하기 (윤다빈)
WITH orders AS (
  SELECT
    f.flavor,
    f.total_order
  FROM first_half AS f
  UNION ALL
  SELECT
    j.flavor,
    j.total_order
  FROM july AS j
)
SELECT
  o.flavor,
  SUM(o.total_order) AS total_order_sum
FROM orders AS o
WHERE 1=1  
GROUP BY
  o.flavor
ORDER BY
  total_order_sum DESC
LIMIT 3;
