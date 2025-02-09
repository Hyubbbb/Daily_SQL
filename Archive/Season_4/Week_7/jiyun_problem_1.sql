SELECT
  user_pseudo_id,
  event_timestamp_kst,
  event_name,
  ga_session_id,
  SUM(
    CASE
      WHEN event_timestamp_kst > new_session_time THEN 1
      WHEN event_name = 'session_start' THEN 1
      ELSE 0
    END
  ) OVER (ORDER BY event_timestamp_kst) AS new_session_id
FROM
  (
    SELECT
      user_pseudo_id,
      event_timestamp_kst,
      event_name,
      ga_session_id,
      CASE
        WHEN event_name = 'session_start' THEN DATETIME(event_timestamp_kst, '+10 minutes')
        ELSE DATETIME(
          LAG(event_timestamp_kst) OVER (PARTITION BY ga_session_id ORDER BY event_timestamp_kst),
          '+10 minutes'
          )
      END AS new_session_time
    FROM ga
    WHERE user_pseudo_id = 'a8Xu9GO6TB'
  )
