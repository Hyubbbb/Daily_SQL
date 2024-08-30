-- 프로그래머스 연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/284528

SELECT GR.EMP_NO, DM.EMP_NAME,
            -- 점수대에 맞는 Grade 컬럼 생성
            CASE
                WHEN SCORE >= 96 THEN "S"
                WHEN SCORE BETWEEN 90 AND 96 THEN "A"
                WHEN SCORE BETWEEN 80 AND 90 THEN "B"
                ELSE "C"
            END AS GRADE,
            -- 점수대에 맞는 Bonus 컬럼 생성
            CASE
                WHEN SCORE >= 96 THEN DM.SAL * 0.2
                WHEN SCORE BETWEEN 90 AND 96 THEN DM.SAL * 0.15
                WHEN SCORE BETWEEN 80 AND 90 THEN DM.SAL * 0.1
                ELSE 0
            END AS BONUS
FROM
    (
        --- Group by를 통해 연간 성과등급 가져온다
        SELECT 
            HR_GRADE.EMP_NO, 
            SUM(HR_GRADE.SCORE)/2 AS SCORE
        FROM HR_GRADE
        GROUP BY EMP_NO
    ) AS GR
JOIN (  
        -- 부서 정보 및 사원 정보 테이블 Inner Join
        SELECT EM.EMP_NO, EM.EMP_NAME, EM.SAL
        FROM HR_DEPARTMENT AS DE
        JOIN HR_EMPLOYEES AS EM
            ON DE.DEPT_ID = EM.DEPT_ID
    ) AS DM
ON DM.EMP_NO = GR.EMP_NO