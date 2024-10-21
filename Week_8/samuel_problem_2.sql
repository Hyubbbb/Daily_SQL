-- https://school.programmers.co.kr/learn/courses/30/lessons/284528
-- CTE를 적극 활용함. 근데 더 좋은 방법이 있을 듯...

WITH AverageScores AS (
    SELECT 
        G.EMP_NO, 
        AVG(G.SCORE) AS SCORE
    FROM HR_GRADE G
    GROUP BY G.EMP_NO
), Cases AS (
    SELECT
        A.EMP_NO,
        CASE
            WHEN A.SCORE >= 96 THEN 'S'
            WHEN A.SCORE >= 90 THEN 'A'
            WHEN A.SCORE >= 80 THEN 'B'
            ELSE 'C'
        END AS GRADE,
        CASE
            WHEN A.SCORE >= 96 THEN E.SAL * 0.20
            WHEN A.SCORE >= 90 THEN E.SAL * 0.15
            WHEN A.SCORE >= 80 THEN E.SAL * 0.10
            ELSE 0
        END AS BONUS
    FROM AverageScores A
    INNER JOIN HR_EMPLOYEES E ON A.EMP_NO = E.EMP_NO
)
SELECT 
    E.EMP_NO, 
    E.EMP_NAME, 
    C.GRADE,
    C.BONUS
FROM HR_EMPLOYEES E
INNER JOIN CASES C ON E.EMP_NO = C.EMP_NO
ORDER BY E.EMP_NO ASC;