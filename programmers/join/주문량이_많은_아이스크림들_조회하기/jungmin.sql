-- 주문량이 많은 아이스크림들 조회하기 (박정민)
WITH total_table AS (
    SELECT *
    FROM first_half
    
    UNION ALL
    
    SELECT *
    FROM july
)

SELECT flavor
FROM total_table AS t
GROUP BY t.flavor
ORDER BY SUM(t.total_order) DESC
LIMIT 3;
