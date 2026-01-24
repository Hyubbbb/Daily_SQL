#https://school.programmers.co.kr/learn/courses/30/lessons/59036
SELECT
    ai.animal_id,
    ai.name
FROM animal_ins AS ai
WHERE 1=1
    AND ai.intake_condition='SICK'
ORDER BY ai.animal_id;