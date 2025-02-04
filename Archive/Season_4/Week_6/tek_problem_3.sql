/* leetcode 585. Investments in 2016
https://leetcode.com/problems/investments-in-2016/description/ */

WITH CTE AS (
    SELECT *, 
        COUNT(*) OVER (partition by tiv_2015) as tiv_2015_cnt,
        COUNT(*) OVER (partition by lat, lon) as lat_lon_cnt
    FROM Insurance
)

-- SELECT ROUND(CAST(SUM(tiv_2016) AS NUMERIC), 2) as tiv_2016
SELECT ROUND(SUM(tiv_2016)::NUMERIC, 2) as tiv_2016
FROM CTE
WHERE tiv_2015_cnt > 1 
    AND lat_lon_cnt < 2