-- [PROGRAMMERS] SELECT > 과일로 만든 아이스크림 고르기

SELECT h.FLAVOR
FROM FIRST_HALF h, ICECREAM_INFO i
WHERE h.FLAVOR = i.FLAVOR
  AND h.TOTAL_ORDER > 3000
  AND i.INGREDIENT_TYPE = 'fruit_based'
ORDER BY h.TOTAL_ORDER DESC;