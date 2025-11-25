SELECT
    a1.animal_id,
    a1.animal_type,
    a1.name
FROM animal_ins AS a1
    JOIN animal_outs AS a2
        ON a1.animal_id = a2.animal_id
WHERE 1=1
    AND a1.sex_upon_intake LIKE "Intact%"
    AND a2.sex_upon_outcome NOT LIKE "Intact%"
ORDER BY
    a1.animal_id ASC;
