SELECT
    i.animal_id      AS animal_id,
    i.animal_type    AS animal_type,
    o.name           AS name
FROM animal_ins AS i
    JOIN animal_outs AS o
        ON o.animal_id = i.animal_id
WHERE 1=1
    AND i.sex_upon_intake LIKE 'Intact%'
    AND (
        o.sex_upon_outcome LIKE 'Spayed%'
        OR o.sex_upon_outcome LIKE 'Neutered%'
    )
ORDER BY
    i.animal_id ASC;
