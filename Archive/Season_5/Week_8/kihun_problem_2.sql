-- https://school.programmers.co.kr/learn/courses/30/lessons/276035
WITH TBL AS (
    SELECT SUM(CODE) AS SUM_CODE
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End')

SELECT
    d.ID,
    d.EMAIL,
    d.FIRST_NAME,
    d.LAST_NAME
FROM DEVELOPERS as d 
    INNER JOIN TBL as t
        ON d.SKILL_CODE & t.SUM_CODE > 0
ORDER BY d.ID ASC
     ;