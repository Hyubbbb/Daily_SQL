SELECT ROUND(COUNT(T1.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM Activity T1
    JOIN (
        SELECT player_id, Min(event_date) AS first_log
        FROM Activity
        GROUP BY player_id
    ) T2 
    ON T1.player_id = T2.player_id
    AND T1.event_date = T2.first_log + INTERVAL 1 DAY
