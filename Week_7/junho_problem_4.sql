-- (https://school.programmers.co.kr/learn/courses/30/lessons/284527, Lv.2)

SELECT SUM(g.SCORE) AS SCORE, e.EMP_NO, e.EMP_NAME, e.POSITION, e.EMAIL
FROM HR_EMPLOYEES as e
JOIN HR_GRADE as g
ON e.EMP_NO = g.EMP_NO
GROUP BY 2
ORDER BY 1 DESC
LIMIT 1;
