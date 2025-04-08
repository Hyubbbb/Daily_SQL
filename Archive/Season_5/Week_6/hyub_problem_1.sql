-- https://leetcode.com/problems/average-time-of-process-per-machine/?envType=study-plan-v2&envId=top-sql-50

WITH A AS(
    SELECT
        machine_id
        , SUM(timestamp) AS sum_ts
    FROM Activity
    WHERE activity_type = 'start'
    GROUP BY machine_id),
B AS(
    SELECT
        machine_id
        , SUM(timestamp) AS sum_ts
    FROM Activity
    WHERE activity_type = 'end'
    GROUP BY machine_id),

CNT AS(
    SELECT 
          machine_id
        , COUNT(*) AS cnt
    FROM Activity 
    GROUP BY machine_id)


SELECT
      a.machine_id
    , ROUND((b.sum_ts - a.sum_ts) / (c.cnt / 2), 3) AS processing_time
FROM A a
JOIN B b
    on a.machine_id = b.machine_id
JOIN CNT c
    on a.machine_id = c.machine_id

-- NEW SOLUTION
-- SELECT
--     machine_id,
--     ROUND(SUM(CASE WHEN activity_type = 'end' THEN timestamp ELSE 0 END) -
--           SUM(CASE WHEN activity_type = 'start' THEN timestamp ELSE 0 END)
--           / COUNT(*) * 2, 3) AS processing_time
-- FROM Activity
-- GROUP BY machine_id;
