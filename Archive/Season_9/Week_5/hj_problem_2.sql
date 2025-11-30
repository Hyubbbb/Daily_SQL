-- https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50
SELECT 
    machine_id,
    ROUND(AVG(processing_time), 3) AS processing_time
FROM (
    SELECT
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END)
        - MIN(CASE WHEN activity_type = 'start' THEN timestamp END) AS processing_time
    FROM Activity
    GROUP BY machine_id, process_id
) AS t
GROUP BY machine_id;
