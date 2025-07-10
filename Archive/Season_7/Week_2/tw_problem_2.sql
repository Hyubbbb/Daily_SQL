SELECT t.id AS "Id"
FROM Weather w JOIN Weather t ON DATEDIFF(t.recordDate, w.recordDate)=1
WHERE w.temperature < t.temperature
-- DATEDIFF는 이렇게 활용
