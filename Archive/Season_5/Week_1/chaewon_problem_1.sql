-- 출처: https://school.programmers.co.kr/learn/courses/30/lessons/273709
-- 특정 희귀도('LEGEND')를 가진 아이템의 가격 총합 구하기

SELECT SUM(PRICE) AS TOTAL_PRICE 
FROM ITEM_INFO 
WHERE RARITY = 'LEGEND'