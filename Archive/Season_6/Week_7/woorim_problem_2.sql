-- https://school.programmers.co.kr/learn/courses/30/lessons/59043
SELECT i.animal_id, i.name
FROM animal_ins i
JOIN animal_outs o
    ON i.animal_id = o.animal_id
WHERE i.datetime > o.datetime
ORDER BY i.datetime
