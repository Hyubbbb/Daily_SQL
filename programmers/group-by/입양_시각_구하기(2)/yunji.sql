WITH RECURSIVE hours AS (
    -- 최초 1회 실행: 0이라는 값을 hour이라는 컬럼에 삽입
    SELECT 0 AS hour
    
    UNION ALL
    
    -- 이후 반복해서 23시까지 행 새로 생성 로직
    SELECT hour + 1
    FROM hours
    WHERE 1=1
        AND hour < 23
)
SELECT
    h.hour AS hour,
    COUNT(a.ANIMAL_ID) AS count
FROM hours AS h
    LEFT JOIN animal_outs AS a
        ON HOUR(a.DATETIME) = h.hour
GROUP BY h.hour
ORDER BY h.hour;
