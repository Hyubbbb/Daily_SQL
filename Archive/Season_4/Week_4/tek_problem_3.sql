/* 1204. Last Person to Fit in the Bus
https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/ */

SELECT sw.person_name
FROM (
    SELECT person_name, SUM(weight) OVER(ORDER BY turn)
    FROM Queue
    ORDER BY sum DESC
) as sw
WHERE sw.sum <= 1000
LIMIT 1;