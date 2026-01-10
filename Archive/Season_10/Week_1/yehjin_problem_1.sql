# https://school.programmers.co.kr/learn/courses/30/lessons/59040
SELECT a.animal_type,
       COUNT(*) AS count
FROM animal_ins AS a
WHERE a.animal_type IN ('cat','dog')
GROUP BY a.animal_type
ORDER BY a.animal_type