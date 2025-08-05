-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/?envType=study-plan-v2&envId=top-sql-50
WITH cnt_frd AS (
    SELECT
        requester_id AS id,
        COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT
        accepter_id AS id,
        COUNT(*) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
)
SELECT
    id,
    SUM(num) AS num
FROM cnt_frd
GROUP BY id
ORDER BY num DESC
LIMIT 1
