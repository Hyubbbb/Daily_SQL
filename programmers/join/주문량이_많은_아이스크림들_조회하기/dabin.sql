-- 주문량이 많은 아이스크림들 조회하기 (윤다빈)
SELECT
  t.flavor,
  SUM(t.total_order) AS total_order
FROM (
  SELECT f.flavor, f.total_order
  FROM first_half as f
  UNION ALL
  SELECT j.flavor, j.total_order
  FROM july AS j
) AS t
GROUP BY t.flavor
ORDER BY total_order DESC
LIMIT 3;
