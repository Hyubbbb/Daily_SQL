-- https://school.programmers.co.kr/learn/courses/30/lessons/59045
SELECT
    i.animal_id as ANIMAL_ID,
    i.animal_type as ANIMAL_TYPE,
    i.name as NAME
from animal_ins as i
    inner join animal_outs as o
        on i.animal_id = o.animal_id
where sex_upon_intake like 'Intact%'
and (sex_upon_outcome like 'Spayed%'
or sex_upon_outcome like 'Neutered%')
order by i.animal_id