WITH RECURSIVE times AS (              -- 0~23시 시간 테이블
    SELECT
        0 AS hour
    UNION ALL
    SELECT
        hour + 1
    FROM times
    WHERE 1=1
        AND hour < 23)
    
SELECT                                 -- 집계
    t.HOUR HOUR,
    COUNT(o.animal_id) AS count
FROM times AS t
     LEFT JOIN animal_outs AS o
        ON t.hour = HOUR(o.datetime)
GROUP BY t.hour
ORDER BY t.hour;
