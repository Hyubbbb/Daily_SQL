-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/?envType=study-plan-v2&envId=top-sql-50

SELECT
      activity_date AS day
    , COUNT(DISTINCT user_id) AS active_users -- DISTINCT를 이 안에 넣어야 하는구나 !
FROM Activity
WHERE 1=1
    AND activity_date <= '2019-07-27'
    AND DATEDIFF('2019-07-27',activity_date) < 30
GROUP BY day
