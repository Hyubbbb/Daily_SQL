-- Write your MySQL query statement below
-- 조건 1) tiv_2015값이 unique한 경우 제외 -> cnt_tbl
-- 조건 2) (lat, lon)이 duplicate인 경우 제외 -> location_tbl
-- 각 WITH문에서 pid로 마지막 쿼리에 포함/제외해주면 해결

WITH cnt_tbl AS (
    SELECT
        *,
        COUNT(*) OVER (PARTITION BY tiv_2015) AS cnt1
    FROM insurance
), location_tbl AS (
    SELECT
        *,
        COUNT(*) OVER (PARTITION BY lat, lon) AS cnt2
    FROM insurance
)

SELECT
    ROUND(SUM(ct.tiv_2016), 2) AS tiv_2016
FROM cnt_tbl ct
    JOIN location_tbl lt
        ON ct.pid=lt.pid
WHERE cnt1 > 1 AND cnt2 = 1
