-- (https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true)

WITH e AS (
        SELECT CASE WHEN SUBSTR(CONVERT(salary,char(4)),1,1) = '0' THEN ''
                    ELSE SUBSTR(CONVERT(salary,char(4)),1,1) END AS c,
                CASE WHEN SUBSTR(CONVERT(salary,char(4)),2,1) = '0' THEN ''
                    ELSE SUBSTR(CONVERT(salary,char(4)),2,1) END AS b,
                CASE WHEN SUBSTR(CONVERT(salary,char(4)),3,1) = '0' THEN ''
                    ELSE SUBSTR(CONVERT(salary,char(4)),3,1) END AS s,
                CASE WHEN SUBSTR(CONVERT(salary,char(4)),4,1) = '0' THEN ''
                    ELSE SUBSTR(CONVERT(salary,char(4)),4,1) END AS i,
                salary
        FROM employees
)

SELECT CEIL(avg(salary)-avg(CONVERT(CONCAT(c,b,s,i),UNSIGNED)))
FROM e;
