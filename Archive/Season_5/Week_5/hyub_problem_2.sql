-- https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

WITH A AS(
    SELECT
        id,
        recordDate,
        temperature
    FROM Weather
),

B AS(
    SELECT
        id,
        DATE_ADD(recordDate, INTERVAL 1 DAY) AS recordDate_2,
        temperature
    FROM Weather
)

SELECT
    A.id
    -- recordDate
FROM A
JOIN B
    on A.recordDate = B.recordDate_2
WHERE A.temperature-B.temperature > 0
