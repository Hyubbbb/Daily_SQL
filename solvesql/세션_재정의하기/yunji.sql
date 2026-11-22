WITH lagged_session AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        LAG(event_timestamp_kst) OVER (ORDER BY event_timestamp_kst) AS prev_time
    FROM ga
    WHERE 1=1
        AND user_pseudo_id = 'S3WDQCqLpK'
), mark AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        SUM(
            CASE
                WHEN prev_time IS NULL 
                    THEN 1
                WHEN TIMESTAMPDIFF(MINUTE, prev_time, event_timestamp_kst) >= 60 
                    THEN 1
                ELSE 0
            END
        ) OVER (ORDER BY event_timestamp_kst) AS session_num
    FROM lagged_session
)

SELECT
    user_pseudo_id,
    MIN(event_timestamp_kst) AS session_start,
    MAX(event_timestamp_kst) AS session_end
FROM mark
GROUP BY user_pseudo_id, session_num
ORDER BY session_start;
