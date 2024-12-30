/* LeetCode 1633. Percentage of Users Attended a Contest
https://leetcode.com/problems/percentage-of-users-attended-a-contest/submissions/1475247358/?envType=study-plan-v2&envId=top-sql-50 */


SELECT r.contest_id, 
    ROUND(COUNT(r.contest_id) / (SELECT COUNT(*) FROM Users), 4) * 100 as percentage
FROM Users as u
LEFT JOIN Register as r
    ON u.user_id = r.user_id
GROUP BY r.contest_id
HAVING r.contest_id IS NOT NULL
ORDER BY percentage DESC, contest_id