과일로 만든 아이스크림 고르기 | https://school.programmers.co.kr/learn/courses/30/lessons/133025



SELECT f.FLAVOR
FROM FIRST_HALF f JOIN ICECREAM_INFO i
ON f.FLAVOR = i.FLAVOR
WHERE TOTAL_ORDER > 3000 
AND INGREDIENT_TYPE = 'fruit_based'
ORDER BY TOTAL_ORDER DESC
