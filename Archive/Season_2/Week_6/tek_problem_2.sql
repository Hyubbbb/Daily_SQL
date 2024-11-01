/* HackerRank Weather Observation Station 20
https://www.hackerrank.com/challenges/weather-observation-station-20/submissions/code/320259468 */


-- Declare variation @rownum to count the row number
SET @rownum := 0;

-- Declare temporary table with @rownum which is called STATION_NUM 
WITH STATION_NUM AS
(
    SELECT @rownum:=@rownum+1 AS NUM, LAT_N
    FROM STATION
    ORDER BY LAT_N
)

-- Query using table STATION_NUM
SELECT ROUND(LAT_N, 4)
FROM STATION_NUM
-- When the NUM is equal to ROUND(COUNT(NUM)/2), that NUM means Median of the NUM
WHERE NUM = (
    SELECT ROUND(COUNT(NUM)/2)
    FROM STATION_NUM
)



-- set @rowindex := -1; 
-- /* 1) creates an index*/ 
-- /* 3) the outer query will select the average of the 2(for odd no. of values)/1(for even) values we found in the middle of the sorted array */
-- select round(avg(lat_n),4)
-- from
-- /* 2) the index will increment for each new value of lat_n it finds, and sort them by lat_n
-- */
--     (select @rowindex:=@rowindex+1 as rowindex, lat_n 
--     from station
--     order by lat_n) as l 
-- where l.rowindex in (floor(@rowindex/2), ceil(@rowindex/2));



-- set @rowindex := 0; 
-- /* 1) creates an index*/ 
-- /* 3) the outer query will select the average of the 2(for odd no. of values)/1(for even) values we found in the middle of the sorted array */
-- select round(lat_n,4)
-- from
-- /* 2) the index will increment for each new value of lat_n it finds, and sort them by lat_n
-- */
--     (select @rowindex:=@rowindex+1 as rowindex, lat_n 
--     from station
--     order by lat_n) as l 
-- -- where l.rowindex in (floor(@rowindex/2), ceil(@rowindex/2));
-- where l.rowindex = round(@rowindex/2)

