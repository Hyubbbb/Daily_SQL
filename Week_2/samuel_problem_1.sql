-- https://school.programmers.co.kr/learn/courses/30/lessons/133027
-- Total sum function definition?

SELECT 
    FH.FLAVOR
FROM 
    FIRST_HALF FH
LEFT JOIN 
    JULY J ON FH.FLAVOR = J.FLAVOR
GROUP BY 
    FH.FLAVOR, FH.TOTAL_ORDER
ORDER BY 
    (FH.TOTAL_ORDER + COALESCE(SUM(J.TOTAL_ORDER), 0)) DESC
LIMIT 3;