-- https://school.programmers.co.kr/learn/courses/30/lessons/284529
SELECT D.DEPT_ID, D.DEPT_NAME_EN, ROUND(AVG(SAL),0) AS AVG_SAL
FROM HR_EMPLOYEES E
INNER JOIN HR_DEPARTMENT D 
ON E.DEPT_ID = D.DEPT_ID
GROUP BY D.DEPT_ID
ORDER BY AVG_SAL DESC;