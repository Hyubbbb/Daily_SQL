-- # Table 1: HR_DEPARTMENT
-- # Table 2: HR_EMPLOYEES

-- # HR_DEPARTMENT와 HR_EMPLOYEES 테이블을 이용해 부서별 평균 연봉을 조회하려 합니다. 부서별로 부서 ID, 영문 부서명, 평균 연봉을 조회
--     # 평균연봉은 소수점 첫째 자리에서 반올림 컬럼명은 AVG_SAL로
--     # 결과는 부서별 평균 연봉을 기준으로 내림차순 정렬

SELECT d.DEPT_ID, DEPT_NAME_EN, ROUND(AVG(SAL), 0) AS AVG_SAL
FROM HR_DEPARTMENT d
    JOIN HR_EMPLOYEES e on d.DEPT_ID = e.DEPT_ID
GROUP BY d.DEPT_ID
ORDER BY AVG_SAL DESC
