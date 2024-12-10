-- https://school.programmers.co.kr/learn/courses/30/lessons/276035
-- Binary는 bitwise operator로 하기!

SELECT 
    D.ID,
    D.EMAIL,
    D.FIRST_NAME,
    D.LAST_NAME
FROM 
    DEVELOPERS D
INNER JOIN 
    SKILLCODES S ON (D.SKILL_CODE & S.CODE) = S.CODE
WHERE 
    S.CATEGORY = 'Front End'
GROUP BY 
    D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
ORDER BY 
    D.ID ASC;