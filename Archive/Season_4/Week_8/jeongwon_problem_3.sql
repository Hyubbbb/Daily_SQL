-- GROUP BY: 부서별 평균 연봉 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/284529

SELECT 
    D.DEPT_ID, 
    D.DEPT_NAME_EN, 
    ROUND(AVG(E.SAL)) AS AVG_SAL
FROM HR_DEPARTMENT D
JOIN HR_EMPLOYEES E ON D.DEPT_ID = E.DEPT_ID
GROUP BY D.DEPT_ID, D.DEPT_NAME_EN
ORDER BY AVG_SAL DESC;
