SELECT animal_id, name,
    CASE
        WHEN sex_upon_intake LIKE '%Neutered%' THEN 'O'
        WHEN sex_upon_intake LIKE '%Spayed%' THEN 'O'
        ELSE 'X'
    END
FROM animal_ins
ORDER BY animal_id;
