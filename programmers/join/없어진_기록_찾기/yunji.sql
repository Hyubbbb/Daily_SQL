-- outs를 기준으로 ins 교집합 제거
SELECT
    ao.animal_id,
    ao.name
FROM animal_outs AS ao

EXCEPT

SELECT
    ai.animal_id,
    ai.name
FROM animal_ins AS ai
ORDER BY animal_id
