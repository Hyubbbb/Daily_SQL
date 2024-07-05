-- 프로그래머스 입양 시각 구하기 (2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/59413

-- 원본 DB에는 0 ~ 6시, 20 ~ 23시에 해당하는 데이터가 존재하지 않는다
-- 재귀 쿼리를 이용해 0 ~ 23의 데이터를 가진 CTE 생성
WITH RECURSIVE CTE
AS (
    -- Non-Recursive 문장 (첫 번째 루프에서만 실행됨)    
    SELECT 0 AS NUM
    UNION ALL
    -- Recursive 문장 (읽어올 때마다 행의 위치가 기억되어 다음번 읽어올 때 다음 행으로 이동)
    SELECT NUM + 1
    FROM CTE
    WHERE NUM < 23
)

SELECT CTE.NUM AS HOUR, COUNT(O.ANIMAL_ID) AS COUT
FROM CTE 
-- Left Join을 이용하여, 0 ~ 6시, 20 ~ 23시에 해당하는 숫자를 원본 데이터베이스와 함께 표시
LEFT JOIN ANIMAL_OUTS AS O
    ON CTE.NUM = HOUR(O.DATETIME)
-- Group by를 통해, 0 ~ 23까지의 시간 데이터를 count 하고 표시
GROUP BY CTE.NUM
ORDER BY HOUR ASC