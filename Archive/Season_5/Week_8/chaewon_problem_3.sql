-- 같은 날 3회 이상 로그인한 사용자 ID를 조회
SELECT user_id, DATE(login_time) AS login_date, COUNT(*) AS login_count
FROM logins
GROUP BY user_id, DATE(login_time)
HAVING COUNT(*) >= 3;
