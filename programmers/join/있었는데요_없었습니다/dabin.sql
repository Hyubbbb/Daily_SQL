-- 있었는데요 없었습니다 (윤다빈)
SELECT 
    ai.animal_id,
    ai.name
FROM animal_ins AS ai
INNER JOIN animal_outs AS ao
    ON ai.animal_id = ao.animal_id
WHERE ai.datetime > ao.datetime
ORDER BY ai.datetime ASC;
