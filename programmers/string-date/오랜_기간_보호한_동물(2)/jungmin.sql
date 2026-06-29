-- 조건1: 입양을 간 동물
-- 조건2: 보호기간이 가장 긴 동물 2마리의 'id'와 'name'

SELECT
    ins.animal_id,
    ins.name
FROM animal_ins AS ins
    JOIN animal_outs AS outs
        ON ins.animal_id = outs.animal_id
ORDER BY (outs.datetime - ins.datetime) DESC
LIMIT 2;
