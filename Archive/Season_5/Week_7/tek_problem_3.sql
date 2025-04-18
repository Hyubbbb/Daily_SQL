/*
leetcode  Medium 한 번 더 풀기
602. Friend Requests II: Who Has the Most Friends
https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/
*/

WITH CTE as
(
    (
        SELECT requester_id as id, COUNT(requester_id) as id_cnt
        FROM RequestAccepted
        GROUP BY requester_id
    )
    UNION ALL
    (
        SELECT accepter_id  as id, COUNT(requester_id) as id_cnt
        FROM RequestAccepted
        GROUP BY accepter_id 
    )
)

SELECT id, sum(id_cnt) as num
FROM CTE
GROUP BY id
ORDER BY num DESC
LIMIT 1