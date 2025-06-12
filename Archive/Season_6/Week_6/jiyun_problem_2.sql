SELECT player_id, event_date AS first_login
FROM (
    SELECT
          *
        , ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS RN
    FROM Activity
) TMP
WHERE RN = 1
