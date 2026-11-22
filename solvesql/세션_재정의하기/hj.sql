WITH previous_time AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        LAG(event_timestamp_kst) OVER (
            ORDER BY event_timestamp_kst
        ) AS previous_timestamp
    FROM ga
    WHERE user_pseudo_id = 'S3WDQCqLpK'
),
session_event AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        SUM(
            CASE
                WHEN previous_timestamp IS NULL
                    OR event_timestamp_kst >= DATE_ADD(previous_timestamp, INTERVAL 1 HOUR)
                    THEN 1
                ELSE 0
            END
        ) OVER (
            ORDER BY event_timestamp_kst
        ) AS session_no
    FROM previous_time
)
SELECT
    user_pseudo_id,
    MIN(event_timestamp_kst) AS session_start,
    MAX(event_timestamp_kst) AS session_end
FROM session_event
GROUP BY user_pseudo_id, session_no
ORDER BY session_start;
