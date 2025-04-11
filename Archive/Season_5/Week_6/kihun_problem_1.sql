-- https://school.programmers.co.kr/learn/courses/30/lessons/59042
SELECT
    ANIMAL_ID,
    NAME
from animal_outs
where animal_id not in (select animal_id from animal_ins)
;