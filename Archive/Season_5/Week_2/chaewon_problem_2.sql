-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/133026
-- 아이스크림 성분 타입별 총주문량을 계산하여 총주문량이 작은 순서대로 조회
SELECT I.INGREDIENT_TYPE, SUM(F.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF F
JOIN ICECREAM_INFO I ON F.FLAVOR = I.FLAVOR
GROUP BY I.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC;