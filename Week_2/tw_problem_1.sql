-- 두 번 이상 쓰인 이름(NAME)
-- 해당 이름이 쓰인 횟수(COUNT)

SELECT NAME, COUNT(NAME) AS COUNT
FROM ANIMAL_INS

GROUP BY NAME
HAVING COUNT(NAME) >= 2
ORDER BY NAME
