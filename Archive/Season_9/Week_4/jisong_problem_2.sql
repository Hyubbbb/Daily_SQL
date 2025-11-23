-- https://school.programmers.co.kr/learn/courses/30/lessons/59044

SELECT
    ins.name      AS name,
    ins.datetime  AS datetime
FROM animal_ins AS ins
LEFT JOIN animal_outs AS outs
    ON outs.animal_id = ins.animal_id
WHERE 1=1
    AND outs.animal_id IS NULL
ORDER BY
    ins.datetime ASC
LIMIT 3;
