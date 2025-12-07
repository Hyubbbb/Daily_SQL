SELECT
    ao.animal_id AS animal_id,
    ao.name      AS name
FROM animal_outs AS ao
LEFT JOIN animal_ins AS ai
    ON ai.animal_id = ao.animal_id
WHERE 1=1
    AND ai.animal_id IS NULL
ORDER BY
    ao.animal_id ASC;
