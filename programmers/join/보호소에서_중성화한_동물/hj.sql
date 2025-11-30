SELECT 
    ai.animal_id,
    ai.animal_type,
    ai.name
FROM animal_ins AS ai
    JOIN animal_outs AS ao
        ON ai.animal_id = ao.animal_id
WHERE 1=1
    AND ai.sex_upon_intake LIKE 'Intact%'
    AND ao.sex_upon_outcome REGEXP '^(Spayed|Neutered)'
