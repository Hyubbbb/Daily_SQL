-- SELECT: 가장 큰 물고기 10마리 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/298517

SELECT ID, LENGTH
FROM FISH_INFO 
ORDER BY LENGTH DESC, ID ASC
LIMIT 10;
