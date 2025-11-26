-- 보호소에서 중성화한 동물 (박정민)
SELECT
    ai.animal_id,
    ai.animal_type,
    ai.name
FROM animal_ins AS ai
    JOIN animal_outs AS ao
        on ai.animal_id = ao.animal_id
WHERE 1=1
    AND ai.sex_upon_intake LIKE 'intact%'
    AND ao.sex_upon_outcome NOT LIKE 'intact%'
ORDER BY ai.animal_id;
