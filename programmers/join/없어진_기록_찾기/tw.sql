SELECT
    ao.animal_id,
    ao.name
FROM animal_outs AS ao
    LEFT OUTER JOIN animal_ins ai
        ON ao.animal_id = ai.animal_id 
WHERE ai.animal_id IS NULL 
ORDER BY ao.animal_id;
