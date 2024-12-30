/* LeetCode Average Time of Process per Machine
https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50 */


-- SELECT lagged2.machine_id, AVG(lagged2.time_diff) as processing_time 
-- FROM (
--         SELECT lagged.machine_id, lagged.process_id, ROUND((lagged.timestamp - lagged.start_time), 3) as time_diff
--         FROM (
--             SELECT *, LAG(timestamp, 1) OVER (PARTITION BY machine_id, process_id ORDER BY machine_id) as start_time
--             FROM Activity
--         ) as lagged
--     WHERE lagged.start_time IS NOT NULL
--     ) as lagged2
-- GROUP BY lagged2.machine_id

select a3.machine_id, round(avg(a3.time_diff), 3) as processing_time
from (
    select a1.machine_id, (a2.timestamp - a1.timestamp) as time_diff
    from Activity as a1
    join Activity as a2
        on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id
    where a1.activity_type = "start" and a2.activity_type = "end"
) as a3
group by a3.machine_id