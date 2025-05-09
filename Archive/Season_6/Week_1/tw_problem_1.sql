-- 조건1: non-evil=0
-- 조건2: power랑 age가 높을 수록 좋다
-- 조건3: 같은 파워라면 -> 최소 금액의 돈이 필요한 지팡이
--  메인 쿼리절과 age와 power가 같은 데이터에 매핑

SELECT w.id, p.age, w.coins_needed, w.power
FROM Wands w JOIN Wands_Property p ON w.code=p.code
WHERE p.is_evil=0 AND w.coins_needed =
      (SELECT MIN(coins_needed)
      FROM Wands w1 JOIN Wands_Property p1 ON w1.code=p1.code
      WHERE p1.is_evil=0 AND w.power = w1.power AND p.age=p1.age)
ORDER BY power DESC, age DESC
