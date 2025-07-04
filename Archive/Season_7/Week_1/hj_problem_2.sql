-- https://school.programmers.co.kr/learn/courses/30/lessons/273709
SELECT SUM(PRICE) AS TOTAL_PRICE
FROM ITEM_INFO
WHERE RARITY = 'LEGEND';