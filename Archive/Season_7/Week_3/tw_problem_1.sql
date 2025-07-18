-- 같은 작업량을 처리하지만, 걸리는 시간이 어떻게 다른지를 확인
-- 왜 나는 SELF JOIN을 떠올리지 못하는가..

SELECT a.machine_id, round(avg(b.timestamp - a.timestamp), 3) AS 'processing_time'
FROM Activity a JOIN Activity b ON a.machine_id = b.machine_id AND a.process_id = b.process_id
WHERE a.activity_type = 'start' AND b.activity_type = 'end'
GROUP BY a.machine_id

-- 붙들고 있던 김에 서브쿼리로도

-- SELECT machine_id, ROUND(((
--     SELECT avg(timestamp)
--     FROM Activity a
--     WHERE activity_type = 'end' and a.machine_id = b.machine_id
-- )-(
--     SELECT avg(timestamp)
--     FROM Activity a
--     WHERE activity_type = 'start' and a.machine_id = b.machine_id
-- )), 3) AS 'processing_time'
-- FROM Activity b
-- GROUP BY machine_id
