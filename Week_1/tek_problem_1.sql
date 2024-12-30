/* 1141. User Activity for the Past 30 Days I
https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/ */

SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users
-- SELECT *
FROM Activity
-- WHERE DATEDIFF("2019-07-27", activity_date) < 30
-- WHERE activity_date > "2019-06-27" AND activity_date <= "2019-07-27"
WHERE activity_date BETWEEN "2019-06-28" AND "2019-07-27"
GROUP BY activity_date