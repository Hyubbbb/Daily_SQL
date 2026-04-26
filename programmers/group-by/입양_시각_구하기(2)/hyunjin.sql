-- 코드를 입력하세요
WITH RECURSIVE time_table AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1 FROM time_table
    WHERE 1=1
       AND hour < 23
)

SELECT
   t.hour, 
   COUNT(ao.animal_id) AS 'count'
FROM time_table AS t
   LEFT JOIN animal_outs AS ao 
      ON t.hour = HOUR(ao.datetime)
GROUP BY t.hour
