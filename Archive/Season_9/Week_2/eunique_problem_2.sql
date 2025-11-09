Programmers > SELECT > 가장 큰 물고기 10마리 구하기
SELECT
  f.id, 
  length 
FROM 
  fish_info AS f
WHERE 1=1
  AND f.length IS NOT NULL
ORDER BY f.length DESC, f.id ASC
LIMIT 10;
