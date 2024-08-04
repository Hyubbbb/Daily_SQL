-- # 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회
--     # 이때 결과는 시간대 순으로 정렬

-- # 입양이 발생하지 않은 시간대도 표시되어야 하는구나

WITH RECURSIVE hours AS (
    SELECT 0 AS HOUR
    
    UNION ALL
    
    SELECT HOUR + 1
    FROM hours
    WHERE HOUR < 23
),

MAIN AS(
SELECT HOUR(DATETIME) AS HOUR, COUNT(*) AS COUNT
FROM ANIMAL_OUTS
GROUP BY HOUR(DATETIME)
ORDER BY HOUR(DATETIME)
)

SELECT h.HOUR, IFNULL(COUNT, 0) AS COUNT
FROM MAIN m 
    RIGHT JOIN hours h on m.HOUR = h.HOUR
ORDER BY h.HOUR
