SELECT
    ao.animal_id,
    ao.animal_type,
    ao.name
FROM animal_outs AS ao
    JOIN animal_ins AS ai
        ON ao.animal_id = ai.animal_id
WHERE 1=1
    AND ao.sex_upon_outcome NOT LIKE 'Intact%'
    AND ai.sex_upon_intake LIKE 'Intact%'
ORDER BY ao.animal_id
