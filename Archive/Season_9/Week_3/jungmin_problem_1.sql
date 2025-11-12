-- programmers (String, Date) : 이름에 el이 들어가는 동물 찾기 (LEVEL 2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/59046
SELECT
    animal_id,
    name,
    sex_upon_intake
FROM animal_ins
WHERE 1=1
    AND name IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
