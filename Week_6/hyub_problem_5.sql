-- # Table 1: HR_DEPARTMENT
-- # Table 2: HR_EMPLOYEES
-- # Table 3: HR_GRADE

-- # 평가 점수별 등급과 등급에 따른 성과금 정보가 아래와 같을 때, 사번, 성명, 평가 등급, 성과금을 조회
--     # 평가등급의 컬럼명은 GRADE로, 성과금의 컬럼명은 BONUS로
--     # 결과는 사번 기준으로 오름차순 정렬

-- # 로직
-- # 1. HR_EMPLOYEES와 HR_GRADE를 JOIN -> SCORE 파악 -> 이걸로 평가 등급, 성과금 생성
-- # 2. 팀은 필요 없는 거 아닌가

SELECT e.EMP_NO, 
       EMP_NAME, 
       CASE 
       WHEN AVG(SCORE) >= 96 THEN 'S'
       WHEN AVG(SCORE) >= 90 THEN 'A'
       WHEN AVG(SCORE) >= 80 THEN 'B'
       ELSE 'C'
       END AS GRADE,
       
       CASE 
       WHEN AVG(SCORE) >= 96 THEN 0.2 * SAL
       WHEN AVG(SCORE) >= 90 THEN 0.15 * SAL
       WHEN AVG(SCORE) >= 80 THEN 0.1 * SAL
       ELSE 0 
       END AS BONUS
       
       
FROM HR_EMPLOYEES e
JOIN HR_GRADE g on e.EMP_NO = g.EMP_NO
GROUP BY e.EMP_NO
ORDER BY e.EMP_NO
