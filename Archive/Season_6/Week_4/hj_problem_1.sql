-- https://school.programmers.co.kr/learn/courses/30/lessons/59040
SELECT ANIMAL_TYPE, COUNT(*) AS count
FROM ANIMAL_INS A 
GROUP BY ANIMAL_TYPE
HAVING ANIMAL_TYPE = 'Cat' OR ANIMAL_TYPE = 'Dog'
ORDER BY 
  CASE ANIMAL_TYPE
    WHEN 'Cat' THEN 1
    WHEN 'Dog' THEN 2
    ELSE 3
  END;