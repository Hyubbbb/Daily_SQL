-- 몇 분이서 오셨어요?
-- https://solvesql.com/problems/size-of-table/
SELECT *
FROM tips
WHERE 1=1 
  AND NOT size%2=0
