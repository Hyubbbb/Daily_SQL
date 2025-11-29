SELECT
    o.animal_id,
    o.animal_type,
    o.name
FROM animal_outs AS o
    JOIN animal_ins AS i
        ON o.animal_id = i.animal_id
WHERE 1=1
    AND o.sex_upon_outcome NOT LIKE 'Intact%'
    AND i.sex_upon_intake LIKE 'Intact%'
ORDER BY o.animal_id
