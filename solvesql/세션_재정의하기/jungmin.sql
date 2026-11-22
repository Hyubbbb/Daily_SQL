WITH tbl AS (
    SELECT
        user_pseudo_id,
        event_timestamp_kst AS ts,
        LAG(event_timestamp_kst) OVER (ORDER BY event_timestamp_kst) AS prev_ts,
        MAX(event_timestamp_kst) OVER () AS last_ts
    FROM ga
    WHERE 1=1
        AND user_pseudo_id = 'S3WDQCqLpK'
)
SELECT
    user_pseudo_id,
    ts AS session_start,
    IFNULL(LEAD(prev_ts) OVER (ORDER BY ts), last_ts) AS session_end
FROM tbl
WHERE 1=1
    AND prev_ts IS NULL
    OR TIMESTAMPDIFF(SECOND, prev_ts, ts) >= 3600
ORDER BY session_start;
