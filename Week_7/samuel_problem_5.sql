-- https://school.programmers.co.kr/learn/courses/30/lessons/276036
-- 어려워...

SELECT 
    CASE
        WHEN (D.SKILL_CODE & MAX(CASE WHEN S.CATEGORY = 'Front End' THEN S.CODE END)) > 0
             AND (D.SKILL_CODE & MAX(CASE WHEN S.NAME = 'Python' THEN S.CODE END)) > 0 THEN 'A'
        WHEN (D.SKILL_CODE & MAX(CASE WHEN S.NAME = 'C#' THEN S.CODE END)) > 0 THEN 'B'
        WHEN (D.SKILL_CODE & MAX(CASE WHEN S.CATEGORY = 'Front End' THEN S.CODE END)) > 0 THEN 'C'
    END AS GRADE,
    D.ID,
    D.EMAIL
FROM DEVELOPERS D
LEFT JOIN SKILLCODES S ON (D.SKILL_CODE & S.CODE) > 0
GROUP BY D.ID, D.EMAIL, D.SKILL_CODE
HAVING GRADE IS NOT NULL
ORDER BY GRADE ASC, D.ID ASC;