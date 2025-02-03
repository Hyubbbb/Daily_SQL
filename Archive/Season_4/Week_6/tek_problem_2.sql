/* leetcode 602. Friend Requests II: Who Has the Most Friends
https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/ */


WITH 
    CTE1 as (
        SELECT requester_id
        FROM RequestAccepted
        UNION ALL
        SELECT accepter_id
        FROM RequestAccepted
),
    CTE2 as (
        SELECT *, RANK() OVER (ORDER BY count DESC)
        FROM (
            SELECT requester_id, COUNT(requester_id)
            FROM CTE1
            GROUP BY requester_id
        ) as g
) 

SELECT requester_id as id, count as num
FROM CTE2
WHERE rank = 1