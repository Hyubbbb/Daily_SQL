SELECT ao.animal_id
    , ao.animal_type
    , ao.name
FROM animal_outs AS ao
INNER JOiN animal_ins AS ai  on ai.animal_id = ao.animal_id
WHERE 1 = 1
    and ai.sex_upon_intake LIKE 'Intact%'
    and ao.sex_upon_outcome NOT LIKE 'Intact%'
