-- [PROGRAMMERS] GROUP BY > 연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기

SELECT e.EMP_NO,
       e.EMP_NAME,
       (CASE WHEN g.SCORE >= 96 THEN 'S'
             WHEN g.SCORE >= 90 THEN 'A'
             WHEN g.SCORE >= 80 THEN 'B'
             ELSE 'C'
        END) GRADE,
       e.SAL * (CASE WHEN g.SCORE >= 96 THEN 0.2
                     WHEN g.SCORE >= 90 THEN 0.15
                     WHEN g.SCORE >= 80 THEN 0.1
                     ELSE 0
                END) BONUS
FROM (SELECT EMP_NO, YEAR, AVG(SCORE) SCORE
      FROM HR_GRADE
      GROUP BY EMP_NO, YEAR) g
     JOIN HR_EMPLOYEES e
     ON e.EMP_NO = g.EMP_NO
ORDER BY 1
