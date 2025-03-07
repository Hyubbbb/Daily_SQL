-- HAVING COUNT(a.x)>1 OR a.X < a.Y
-- X=Y인 케이스여도 그 행의 개수가 2개 이상이어야 문제에서 제시하는 Symmetric Pairs 조건에 부합한다는걸 놓쳐서 계속 헤맸음- HAVING COUNT(a.x)>1 OR a.X < a.Y
-- X=Y인 케이스여도 그 행의 개수가 2개 이상이어야 문제에서 제시하는 Symmetric Pairs 조건에 부합한다는걸 놓쳐서 계속 헤맸음

SELECT DISTINCT a.X, a.Y
FROM Functions a JOIN Functions b ON a.X = b.Y AND a.Y = b.X
GROUP BY a.X, a.Y
HAVING COUNT(a.x)>1 OR a.X < a.Y
ORDER BY a.X
