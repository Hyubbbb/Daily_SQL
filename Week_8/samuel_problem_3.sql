-- https://school.programmers.co.kr/learn/courses/30/lessons/284529

WITH AVGS AS (
    SELECT
        E.DEPT_ID,
        ROUND(AVG(E.SAL),0) AS SAL
        FROM HR_EMPLOYEES E
        GROUP BY E.DEPT_ID
)
SELECT
    D.DEPT_ID,
    D.DEPT_NAME_EN,
    A.SAL AS AVG_SAL
FROM HR_DEPARTMENT D
JOIN AVGS A
ON D.DEPT_ID = A.DEPT_ID
ORDER BY A.SAL DESC;