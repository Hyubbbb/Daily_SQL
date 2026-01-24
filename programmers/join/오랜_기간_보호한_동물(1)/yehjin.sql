SELECT
    ai.name,
    ai.datetime
FROM animal_ins AS ai
    LEFT JOIN animal_outs AS ao
        ON ai.animal_id=ao.animal_id
WHERE 1=1
    AND ao.animal_id IS NULL
ORDER BY ai.datetime
LIMIT 3;