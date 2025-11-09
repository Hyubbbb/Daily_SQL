# 서브쿼리 대신 with 구문으로 전면 수정
WITH combined_orders AS (
    SELECT 
        flavor, 
        SUM(total_order) AS total
    FROM (
        # 세로로 concat => 합집합 UNION 활용!
        SELECT 
            flavor, 
            total_order
        FROM first_half
        UNION ALL
            SELECT flavor, total_order
            FROM july
    ) AS jan_jul
    GROUP BY flavor
)

SELECT flavor
FROM combined_orders
ORDER BY total DESC
LIMIT 3;
