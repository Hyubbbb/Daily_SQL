-- Write your MySQL query statement below
-- SUM() OVER를 활용한 누적합 활용
-- DESC에 따른 LIMIT로 행 개수 제한 활용

WITH base_tbl AS (
    SELECT
        person_id,
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS 'cumulative'
    FROM queue
    ORDER BY turn
) 

SELECT person_name
FROM base_tbl
WHERE cumulative <= 1000
ORDER BY turn DESC
LIMIT 1
