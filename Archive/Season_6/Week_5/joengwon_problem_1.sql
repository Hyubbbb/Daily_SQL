-- FrontEnd 개발자 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/276035

SELECT DISTINCT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS D
JOIN SKILLCODES S ON (D.SKILL_CODE & S.CODE) = S.CODE
WHERE S.CATEGORY = 'Front End'
ORDER BY D.ID ASC;
