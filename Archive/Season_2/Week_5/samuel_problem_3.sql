-- https://school.programmers.co.kr/learn/courses/30/lessons/59415
-- Easy

SELECT MAX(DATETIME) AS "시간"
FROM ANIMAL_INS;

-- Less efficient:
-- SELECT DATETIME AS "시간"
-- FROM ANIMAL_INS
-- ORDER BY DATETIME DESC
-- LIMIT 1;
-- or...
-- WHERE DATETIME = (SELECT MAX(DATETIME) FROM ANIMAL_INS);
