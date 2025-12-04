-- 보호소에서 중성화한 동물 (윤다빈)
SELECT
    ai.animal_id   AS animal_id,
    ai.animal_type AS animal_type,
    ai.name        AS name
FROM animal_ins AS ai
JOIN animal_outs AS ao
    ON ai.animal_id = ao.animal_id
WHERE ai.sex_upon_intake LIKE 'Intact%'
  AND ao.sex_upon_outcome NOT LIKE 'Intact%'
ORDER BY ai.animal_id;
