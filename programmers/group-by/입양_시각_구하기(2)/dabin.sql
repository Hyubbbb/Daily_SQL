-- 시간대별 입양 건수 구하기
WITH RECURSIVE hours AS (
    SELECT 
        0 AS hour
    UNION ALL
    SELECT 
        hour + 1
    FROM 
        hours
    WHERE 1=1
      AND hour < 23
)

SELECT
    h.hour,
    COUNT(o.datetime) AS count
FROM hours AS h
    LEFT JOIN animal_outs AS o
        ON HOUR(o.datetime) = h.hour
    WHERE 1=1
GROUP BY
    h.hour
ORDER BY
    h.hour;
