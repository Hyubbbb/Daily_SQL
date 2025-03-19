WITH TMP AS (
SELECT *,
  user_pseudo_id
  ,CASE WHEN event_timestamp_kst > onehour_later OR onehour_later IS NULL 
    THEN event_timestamp_kst END AS session_start
FROM ( 
  SELECT user_pseudo_id, event_timestamp_kst, ga_session_id, event_name
    ,DATETIME(LAG(event_timestamp_kst) OVER (ORDER BY event_timestamp_kst), '+1 hour') AS onehour_later
  FROM ga
  WHERE user_pseudo_id='S3WDQCqLpK'
  )
)

SELECT *
FROM(
  SELECT
    user_pseudo_id
    ,session_start
    ,FIRST_VALUE(event_timestamp_kst) 
      OVER (PARTITION BY session_id ORDER BY event_timestamp_kst DESC) AS session_end
  FROM(
    SELECT *
      ,SUM(CASE WHEN session_start IS NOT NULL THEN 1 END)
        OVER (ORDER BY event_timestamp_kst) AS session_id
    FROM TMP 
  )
)
WHERE session_start IS NOT NULL
