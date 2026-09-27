-- https://school.programmers.co.kr/learn/courses/30/lessons/59410
-- Null 처리하기

SELECT
    animal_type,
    IFNULL(name, 'No name') AS name,
    sex_upon_intake
FROM animal_ins
ORDER BY animal_id;
