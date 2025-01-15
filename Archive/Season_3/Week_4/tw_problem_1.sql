-- 2022년도 한해 평가 점수가 가장 높은 사원 정보
-- HR_DEPARTMENT - 왜 있는거지
-- HR_GRADE - 점수, 사번, 
-- HR_EMPLOYEES - 성명, 직책, 이메일, 사번

SELECT SUM(SCORE) AS SCORE, e.EMP_NO, EMP_NAME, POSITION, EMAIL
FROM HR_EMPLOYEES e JOIN HR_GRADE g ON e.EMP_NO = g.EMP_NO
WHERE YEAR = 2022
GROUP BY e.EMP_NO
ORDER BY SCORE DESC
LIMIT 1