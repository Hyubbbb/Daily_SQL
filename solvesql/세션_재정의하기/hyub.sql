WITH 
step1_lag1 AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        LAG(event_timestamp_kst) OVER (
            PARTITION BY user_pseudo_id
            ORDER BY event_timestamp_kst
        ) AS lag1
    FROM ga
    WHERE 1=1
        AND user_pseudo_id = 'S3WDQCqLpK'
),
step2_session_flag AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        CASE
            WHEN lag1 IS NULL
                THEN 1
            WHEN TIMESTAMPDIFF(SECOND, lag1, event_timestamp_kst) >= 3600 
                THEN 1
            ELSE 0
        END AS is_new_session
    FROM step1_lag1
),
step3_session_group AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst,
        SUM(is_new_session) OVER (
            PARTITION BY user_pseudo_id
            ORDER BY event_timestamp_kst
        ) AS new_session_id
    FROM step2_session_flag
)
SELECT
    user_pseudo_id,
    MIN(event_timestamp_kst) AS session_start,
    MAX(event_timestamp_kst) AS session_end
FROM step3_session_group
GROUP BY user_pseudo_id, new_session_id
ORDER BY session_start;