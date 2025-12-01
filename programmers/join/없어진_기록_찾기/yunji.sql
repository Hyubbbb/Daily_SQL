-- outs를 기준으로 ins 교집합 제거
SELECT
    o.animal_id,
    o.name
FROM animal_outs AS o

EXCEPT

SELECT
    i.animal_id,
    i.name
FROM animal_ins AS i
ORDER BY animal_id
