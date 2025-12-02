SELECT 
    ao.animal_id,
    ao.name
FROM animal_outs AS ao
    LEFT JOIN animal_ins AS ai 
        ON ao.animal_id = ai.animal_id
WHERE 1=1
    AND ai.animal_id IS NULL
ORDER BY ao.animal_id;
