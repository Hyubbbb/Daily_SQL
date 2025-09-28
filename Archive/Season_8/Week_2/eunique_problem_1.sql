https://school.programmers.co.kr/learn/courses/30/lessons/133025
SELECT
  f.FLAVOR,
  i.INGREDIENT_TYPE,
  f.TOTAL_ORDER
FROM FIRST_HALF AS f
JOIN ICECREAM_INFO AS i
  ON i.FLAVOR = f.FLAVOR;
