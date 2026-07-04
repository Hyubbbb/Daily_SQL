SELECT
    ins.animal_id,
    ins.name    
FROM animal_ins AS ins
    INNER JOIN animal_outs AS outs
        ON ins.animal_id = outs.animal_id
ORDER BY (outs.datetime - ins.datetime) DESC
LIMIT 2;
