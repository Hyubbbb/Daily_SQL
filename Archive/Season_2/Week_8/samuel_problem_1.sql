-- https://school.programmers.co.kr/learn/courses/30/lessons/284527
-- 함수 정의해서 풀기


WITH TotalScores AS (
    SELECT 
        G.EMP_NO, 
        SUM(G.SCORE) AS SCORE
    FROM HR_GRADE G
    WHERE G.YEAR = 2022
    GROUP BY G.EMP_NO
)
SELECT 
    T.SCORE,
    E.EMP_NO, 
    E.EMP_NAME, 
    E.POSITION, 
    E.EMAIL
FROM HR_EMPLOYEES E
INNER JOIN TotalScores T ON E.EMP_NO = T.EMP_NO
WHERE T.SCORE = (SELECT MAX(SCORE) FROM TotalScores)
ORDER BY E.EMP_NO ASC;