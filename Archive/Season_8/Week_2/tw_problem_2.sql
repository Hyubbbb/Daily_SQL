-- Write your MySQL query statement below
-- 3번 이상 연속으로 나온 놈
-- 3번 보다 더 나와도 3번만 체크하면 되긴 함

WITH next_1 AS (
    SELECT
        id,
        num,
        LEAD(num) OVER(ORDER BY id) AS 'next1'
    FROM Logs
), next_2 AS (
    SELECT
        id,
        num,
        next1,
        LEAD(next1) OVER(ORDER BY id) AS 'next2'
    FROM next_1
)

SELECT DISTINCT(num) AS "ConsecutiveNums"
FROM next_2
WHERE num = next1 AND next1 = next2
