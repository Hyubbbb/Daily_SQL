-- 코드를 입력하세요
SELECT B.INGREDIENT_TYPE, SUM(TOTAL_ORDER) TOTAL_ORDER
FROM FIRST_HALF A JOIN ICECREAM_INFO B ON A.FLAVOR = B.FLAVOR
GROUP BY B.INGREDIENT_TYPE
