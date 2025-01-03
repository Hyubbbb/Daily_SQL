-- SOCRE가 분기로 나뉘어져 있는데 이를 어떻게 처리해야하는지 문제에서 안알려줌;;
-- 어이없ㅅ

WITH score AS (
    SELECT EMP_NO,
        CASE
            WHEN AVG(SCORE) >= 96 THEN 'S'
            WHEN AVG(SCORE) >= 90 THEN 'A'
            WHEN AVG(SCORE) >= 80 THEN 'B'
            ELSE 'C'
        END AS GRADE
    FROM HR_GRADE
    -- WHERE YEAR = 2022
    GROUP BY EMP_NO)
    
SELECT 
    e.EMP_NO, e.EMP_NAME, s.GRADE,
    CASE
        WHEN s.GRADE = 'S' THEN e.SAL*0.2
        WHEN s.GRADE = 'A' THEN e.SAL*0.15
        WHEN s.GRADE = 'B' THEN e.SAL*0.1
        ELSE 0
    END AS BONUS
FROM HR_EMPLOYEES e LEFT JOIN score s ON e.EMP_NO = s.EMP_NO
ORDER BY e.EMP_NO
