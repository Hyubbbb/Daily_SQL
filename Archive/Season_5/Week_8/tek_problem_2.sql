/*
leetcode  Medium 한 번 더 풀기
262. Trips and Users
https://leetcode.com/problems/trips-and-users/description/
*/

SELECT t.request_at as "Day",
    ROUND(SUM(CASE WHEN t.status != 'completed' THEN 1 ELSE 0 END) / COUNT(t.status) ::NUMERIC, 2) as "Cancellation Rate"
FROM Trips as t
INNER JOIN (SELECT * FROM Users WHERE role = 'client' AND banned = 'No') as u1
    ON t.client_id = u1.users_id
INNER JOIN (SELECT * FROM Users WHERE role = 'driver' AND banned = 'No') as u2
    ON t.driver_id = u2.users_id
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at