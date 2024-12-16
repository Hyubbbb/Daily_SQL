--Organize Runners into Groups
SELECT main_distance, COUNT(*) AS runners_number
FROM RUNNER
GROUP BY main_distance
HAVING COUNT(*) > 3;

--How Many Runners Participate in Each Event
SELECT E.name, COUNT(RE.runner_id) AS runner_count -- * 로 적어도 됨.
FROM EVENT E
LEFT JOIN RUNNER_EVENT RE
ON E.id = RE.event_id
GROUP BY E.id, E.name;
-- 0명이 참가하는 경우를 위해 EVENT 를 기준으로 RUNNER_EVENT를 LEFT JOIN 한다다