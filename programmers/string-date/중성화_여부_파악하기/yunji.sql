SELECT
    animal_id,
    name,
    CASE
        WHEN sex_upon_intake LIKE '%Neutered%'
        OR sex_upon_intake LIKE '%Spayed%'
            THEN 'O'
        ELSE 'X'
    END AS 중성화
FROM animal_ins
ORDER BY animal_id;
