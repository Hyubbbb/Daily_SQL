-- https://school.programmers.co.kr/learn/courses/30/lessons/59043
-- Easy

SELECT 
    AI.ANIMAL_ID, 
    AI.NAME
FROM 
    ANIMAL_INS AI
JOIN 
    ANIMAL_OUTS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE 
    AO.DATETIME < AI.DATETIME
ORDER BY 
    AI.DATETIME ASC;