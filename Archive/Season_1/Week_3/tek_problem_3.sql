-- 프로그래머스 우유와 요거트가 담긴 장바구니
-- https://school.programmers.co.kr/learn/courses/30/lessons/62284

SELECT CP.CART_ID
FROM CART_PRODUCTS AS CP
GROUP BY CP.CART_ID
-- GROUP_CONCAT으로 CART_ID별 구매한 물건을 합쳐준 후, Milk와 Yogurt 필터링
HAVING (GROUP_CONCAT(CP.NAME) LIKE "%Milk%") 
    AND (GROUP_CONCAT(CP.NAME) LIKE "%Yogurt%")
ORDER BY CP.CART_ID