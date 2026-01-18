#https://school.programmers.co.kr/learn/courses/30/lessons/59414
SELECT
  ai.animal_id,
  ai.name,
  DATE_FORMAT(ai.datetime, '%Y-%m-%d') AS 날짜
FROM animal_ins AS ai
ORDER BY animal_id
