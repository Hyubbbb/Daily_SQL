-- https://school.programmers.co.kr/learn/courses/30/lessons/276034
-- JOIN ON, BITWISE operator, DISTINCT for unique values

SELECT DISTINCT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS D
JOIN SKILLCODES s ON (d.SKILL_CODE & s.CODE) = s.CODE
WHERE s.NAME = 'Python' OR s.NAME = 'C#'
ORDER BY D.ID ASC;