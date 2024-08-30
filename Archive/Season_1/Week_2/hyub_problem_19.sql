# TABLE 1: HR_DEPARTMENT
# TABLE 2: HR_EMPLOYEES
# TABLE 3: HR_GRADE

# 2022년도 평가 점수가 가장 높은 사원들의 점수, 사번, 성명, 직책, 이메일을 조회
    # 2022년도의 평가 점수는 상,하반기 점수의 합을 의미하고, 
    # 평가 점수를 나타내는 컬럼의 이름은 SCORE로 해주세요.

# HR_GRADE에서 상하반기 점수 합 (GROUP BY)
# 점수, 사번까지는 HR_GRADE에서 확보
# 성명, 직책, 이메일은 HR_EMPLOYEES
# 아마 HR_DEPARTMENT는 필요 없을듯


SELECT SUM(SCORE) AS SCORE, g.EMP_NO, EMP_NAME, POSITION, EMAIL
FROM HR_GRADE g JOIN HR_EMPLOYEES e on g.EMP_NO = e.EMP_NO
GROUP BY EMP_NO
ORDER BY SCORE DESC
LIMIT 1
