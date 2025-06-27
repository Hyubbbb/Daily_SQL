-- https://school.programmers.co.kr/learn/courses/30/lessons/59042
SELECT o.animal_id, o.name
FROM animal_ins i
RIGHT OUTER JOIN animal_outs o
    ON i.animal_id = o.animal_id
WHERE ISNULL(i.animal_id)
