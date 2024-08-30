-- 프로그래머스 언어별 개발자 분류하기 (비트연산자로 풀이)
-- https://school.programmers.co.kr/learn/courses/30/lessons/276036

SELECT *
FROM (
    SELECT 
        -- GROUP_CONCAT을 통해 그룹별로 CATEGORY, NAME을 합쳐주고 조건을 넣는다
        CASE
            WHEN (GROUP_CONCAT(S.CATEGORY) LIKE "%Front End%") & (GROUP_CONCAT(S.NAME) LIKE "%Python%") THEN "A"
            WHEN (GROUP_CONCAT(S.NAME) LIKE "%C#%") THEN "B"
            WHEN (GROUP_CONCAT(S.CATEGORY) LIKE "%Front End%") THEN "C"
        END AS GRADE,
        D.ID, 
        D.EMAIL
    FROM SKILLCODES AS S, DEVELOPERS AS D
    WHERE 1=1
        -- 비트연산자를 사용하여 DEVELOPERS의 SKILL_CODE에 맞는 CODE 전부 가져온다
        AND D.SKILL_CODE & S.CODE
    -- GROUP_CONCAT을 위해 ID, EMAIL을 기준으로 GROUP BY
    GROUP BY D.ID, D.EMAIL
    -- 오름차순 조건에 맞춰 ORDER BY
    ORDER BY GRADE, D.ID
) AS G
-- GRADE 컬럼에 NULL 값이 존재하므로 필터링 해준다
WHERE G.GRADE IS NOT NULL