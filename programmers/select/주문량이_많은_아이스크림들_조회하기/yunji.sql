SELECT FLAVOR
FROM (
    SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL
    FROM (
        # 세로로 concat => 합집합 UNION 활용!
        SELECT FLAVOR, TOTAL_ORDER FROM FIRST_HALF
        UNION ALL
        SELECT FLAVOR, TOTAL_ORDER FROM JULY
    ) AS JAN_JUL
    GROUP BY FLAVOR
    ORDER BY TOTAL DESC
    # 판다스 head() 역할과 유사
    LIMIT 3
    # 서브쿼리 실현 후 alias 붙여주기 필수!
) AS RES;
