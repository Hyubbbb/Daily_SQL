-- 코드를 입력하세요
SELECT F.FLAVOR FROM FIRST_HALF F
JOIN ICECREAM_INFO I
ON F.FLAVOR = I.FLAVOR
WHERE TOTAL_ORDER > 3000 AND INGREDIENT_TYPE = 'FRUIT_BASED'
ORDER BY TOTAL_ORDER DESC;
