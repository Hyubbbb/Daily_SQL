WITH Cnt AS (SELECT COUNT(user_id) as "cnt_user_id"
FROM Users)

SELECT r.contest_id, ROUND((COUNT(r.user_id)/cnt_user_id)*100, 2) as "percentage"
FROM Cnt c CROSS JOIN Register r
GROUP BY r.contest_id
ORDER BY 2 DESC, 1
