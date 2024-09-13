-- 프로그래머스 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/133025
-- 상반기 총주문량이 3000보다 높으면서, 주 성분이 과일인 아이스크림의 맛을 총주문량 내림차순으로 조회하는 쿼리

SELECT F.FLAVOR
FROM FIRST_HALF F
JOIN ICECREAM_INFO I
ON F.FLAVOR = I.FLAVOR
WHERE F.TOTAL_ORDER > 3000
AND I.INGREDIENT_TYPE = 'fruit_based'
ORDER BY F.TOTAL_ORDER DESC;
