-- https://school.programmers.co.kr/learn/courses/30/lessons/59037
SELECT
    animal_id,
    name
FROM animal_ins
WHERE 1=1
    AND intake_condition NOT LIKE 'aged'
ORDER BY animal_id;
