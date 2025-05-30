-- 연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/284528

SELECT
    E.EMP_NO,
    E.EMP_NAME,
    CASE
        WHEN AVG(G.SCORE) >= 96 THEN 'S'
        WHEN AVG(G.SCORE) >= 90 THEN 'A'
        WHEN AVG(G.SCORE) >= 80 THEN 'B'
        ELSE 'C'
    END AS GRADE,
    FLOOR(
        CASE
            WHEN AVG(G.SCORE) >= 96 THEN E.SAL * 0.20
            WHEN AVG(G.SCORE) >= 90 THEN E.SAL * 0.15
            WHEN AVG(G.SCORE) >= 80 THEN E.SAL * 0.10
            ELSE 0
        END
    ) AS BONUS
FROM HR_EMPLOYEES E
JOIN HR_GRADE G ON E.EMP_NO = G.EMP_NO
WHERE G.YEAR = 2022
GROUP BY E.EMP_NO, E.EMP_NAME, E.SAL
ORDER BY E.EMP_NO;
