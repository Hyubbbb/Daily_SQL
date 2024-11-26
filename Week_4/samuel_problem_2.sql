-- https://school.programmers.co.kr/learn/courses/30/lessons/59044
-- LIMIT을 이용해 상위 3개의 데이터만 가져오기

SELECT 
    AI.NAME, 
    AI.DATETIME
FROM 
    ANIMAL_INS AI
LEFT JOIN 
    ANIMAL_OUTS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE 
    AO.ANIMAL_ID IS NULL
ORDER BY 
    AI.DATETIME ASC
LIMIT 3;