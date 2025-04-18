/*
leetcode Medium 한 번 더 풀기
585. Investments in 2016
https://leetcode.com/problems/investments-in-2016/description/
*/


WITH CTE AS (
    SELECT *, 
        COUNT(tiv_2015) OVER(PARTITION BY tiv_2015) as tiv_cnt, 
        COUNT(lat) OVER(PARTITION BY lat, lon) as lat_cnt
    FROM Insurance
)

SELECT ROUND(SUM(tiv_2016)::NUMERIC, 2) as tiv_2016
FROM CTE
WHERE tiv_cnt > 1 AND lat_cnt < 2