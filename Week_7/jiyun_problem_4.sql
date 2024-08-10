-- 코드를 작성해주세요
WITH GRADE_TABLE AS(
    SELECT EMP_NO, CASE
        WHEN SUM(SCORE)/2 >= 96 THEN 'S'
        WHEN SUM(SCORE)/2 >= 90 THEN 'A'
        WHEN SUM(SCORE)/2 >= 80 THEN 'B'
        ELSE 'C'
        END AS GRADE
FROM HR_GRADE GROUP BY EMP_NO)
    
SELECT A.EMP_NO, A.EMP_NAME, B.GRADE,
    CASE WHEN B.GRADE = 'S' THEN SAL*0.2
        WHEN B.GRADE = 'A' THEN SAL*0.15
        WHEN B.GRADE = 'B' THEN SAL*0.1
        ELSE SAL*0
        END AS BONUS
FROM HR_EMPLOYEES A JOIN GRADE_TABLE B ON A.EMP_NO = B.EMP_NO
ORDER BY EMP_NO;
