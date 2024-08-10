-- 코드를 작성해주세요
WITH AVG_TABLE AS(
    SELECT DEPT_ID, SUM(SAL) / COUNT(*) AS AVG_SAL FROM HR_EMPLOYEES
    GROUP BY DEPT_ID)

SELECT A.DEPT_ID, DEPT_NAME_EN, ROUND(AVG_SAL, 0) AS AVG_SAL
FROM HR_DEPARTMENT A JOIN AVG_TABLE B ON A.DEPT_ID = B.DEPT_ID
ORDER BY AVG_SAL DESC;