-- JOIN: 오랜 기간 보호한 동물(1)
-- https://school.programmers.co.kr/learn/courses/30/lessons/59044

SELECT
    AI.NAME,
    AI.DATETIME
FROM
    ANIMAL_INS AI
LEFT JOIN
    ANIMAL_OUTS AO
ON
    AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE
    AO.ANIMAL_ID IS NULL
ORDER BY
    AI.DATETIME ASC
LIMIT 3;
