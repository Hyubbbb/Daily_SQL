WITH lagged_events AS (
  SELECT
    user_pseudo_id,
    event_name,
    event_timestamp_kst,
    LAG(event_timestamp_kst) OVER (PARTITION BY user_pseudo_id ORDER BY event_timestamp_kst) AS prev_timestamp,
    
    -- START
    (julianday(event_timestamp_kst) - julianday(LAG(event_timestamp_kst) OVER (PARTITION BY user_pseudo_id ORDER BY event_timestamp_kst))) * 24 * 60 AS time_diff_start, -- min
    
    -- END
    (julianday(LEAD(event_timestamp_kst) OVER (PARTITION BY user_pseudo_id ORDER BY event_timestamp_kst)) - julianday(event_timestamp_kst)) * 24 * 60 AS time_diff_end

  FROM ga
  WHERE user_pseudo_id = 'S3WDQCqLpK'
),
TMP AS (
    SELECT 
      user_pseudo_id,
      -- CASE
      --   WHEN (time_diff_start >= 60) OR (time_diff_start IS NULL) THEN 1
      --   ELSE 0 END AS 'is_start',
      -- CASE
      --   WHEN (time_diff_end >= 60) OR (time_diff_end IS NULL) THEN 1
      --   ELSE 0 END AS 'is_end',
      CASE
        WHEN (time_diff_start >= 60) OR (time_diff_start IS NULL) THEN event_timestamp_kst
        ELSE NULL END AS 'time_start',
      CASE
        WHEN (time_diff_end >= 60) OR (time_diff_end IS NULL) THEN event_timestamp_kst
        ELSE NULL END AS 'time_end'
    FROM lagged_events),
t1 AS (
  SELECT
    user_pseudo_id,
    time_start,
    ROW_NUMBER() OVER () AS rn
  FROM TMP
  WHERE time_start IS NOT NULL),
t2 AS (
  SELECT
    user_pseudo_id,
    time_end,
    ROW_NUMBER() OVER () AS rn
  FROM TMP
  WHERE time_end IS NOT NULL)

SELECT
  t1.user_pseudo_id,
  t1.time_start AS session_start,
  t2.time_end AS session_end
FROM t1 
JOIN t2 
  ON t1.rn = t2.rn;
