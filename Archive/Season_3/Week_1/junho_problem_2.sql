SELECT player_id, event_date AS first_login
FROM (SELECT player_id, ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS num, event_date
        FROM activity) AS a
WHERE num = 1;
