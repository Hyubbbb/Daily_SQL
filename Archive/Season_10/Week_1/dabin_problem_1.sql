-- 과일로 만든 아이스크림 고르기(윤다빈)
SELECT
  fh.flavor
FROM first_half AS fh
  INNER JOIN icecream_info AS ii
    ON fh.flavor = ii.flavor
WHERE 1=1
  AND fh.total_order > 3000
  AND ii.ingredient_type = 'fruit_based'
ORDER BY fh.total_order DESC;
