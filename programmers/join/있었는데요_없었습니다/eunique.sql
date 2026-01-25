-- 코드를 입력하세요
SELECT
    ai.animal_id,
    ai.name
FROM animal_ins AS ai
    JOIN animal_outs AS ao
        ON ai.animal_id = ao.animal_id
WHERE 1=1 
    AND ao.datetime < ai.datetime
ORDER BY ai.datetime;
