/*
leetcode  Medium 한 번 더 풀기
601. Human Traffic of Stadium
https://leetcode.com/problems/human-traffic-of-stadium/description/
*/

-- Write your PostgreSQL query statement below

WITH c1 AS (
    SELECT *
    FROM Stadium
    WHERE people >= 100
), c2 AS (
    SELECT *, id - rownum as diff
    FROM (
        SELECT id, visit_date, people, ROW_NUMBER() OVER (ORDER BY id) as rownum 
        FROM c1
    )
)

SELECT c3.id, c3.visit_date, c3.people
FROM (
    SELECT *, COUNT(*) OVER (PARTITION BY diff) as cnt
    FROM c2
) as c3
WHERE c3.cnt >= 3