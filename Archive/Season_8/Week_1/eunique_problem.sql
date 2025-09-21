https://school.programmers.co.kr/learn/courses/30/lessons/298517 
SELECT
  ID,
  LENGTH
FROM FISH_INFO
WHERE LENGTH IS NOT NULL
ORDER BY LENGTH DESC, ID ASC
LIMIT 10;
