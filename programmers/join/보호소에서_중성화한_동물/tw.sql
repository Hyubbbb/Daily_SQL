-- 코드를 입력하세요
SELECT 
    ai.animal_id,
    ai.animal_type,
    ai.name
FROM animal_ins ai
    JOIN animal_outs ao
        ON ai.animal_id = ao.animal_id
WHERE 1=1
    AND ai.sex_upon_intake LIKE 'Intact%'
    AND ao.sex_upon_outccome NOT LIKE 'Intact%'
ORDER BY ai.animal_id;
