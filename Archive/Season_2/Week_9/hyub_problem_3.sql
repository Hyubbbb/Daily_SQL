-- https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

WITH A AS(
SELECT 
    TASK_ID,
    START_DATE,
    END_DATE,
    LAG(END_DATE) OVER(ORDER BY START_DATE) AS END_LAG,
    LEAD(START_DATE) OVER(ORDER BY START_DATE) AS START_LAG
FROM PROJECTS )

SELECT START_DATE, END_DATE
FROM (
    SELECT START_DATE, ROW_NUMBER() OVER() AS RNUM
    FROM A
    WHERE END_LAG != START_DATE 
        OR END_LAG IS NULL) a
JOIN( 
    SELECT END_DATE, ROW_NUMBER() OVER() AS RNUM
    FROM A
    WHERE START_LAG != END_DATE 
        OR START_LAG IS NULL) b on a.RNUM = b.RNUM
ORDER BY DATEDIFF(END_DATE, START_DATE), START_DATE