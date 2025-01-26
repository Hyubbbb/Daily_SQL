-- https://solvesql.com/problems/redefine-session-2/

WITH TMP AS(
SELECT 
    user_pseudo_id
  , event_timestamp_kst
  , (julianday(event_timestamp_kst) - julianday(LAG(event_timestamp_kst) OVER (ORDER BY event_timestamp_kst ASC))) * 1440 AS min_change
  , CASE 
    WHEN (julianday(event_timestamp_kst) - julianday(LAG(event_timestamp_kst) OVER (ORDER BY event_timestamp_kst ASC))) * 1440 >= 10 THEN 1
    ELSE 0 END AS session_change
  , event_name
  , ga_session_id
FROM ga
WHERE user_pseudo_id = 'a8Xu9GO6TB')

SELECT
    user_pseudo_id
  , event_timestamp_kst
  , event_name
  , ga_session_id
  , SUM(session_change) OVER(
      ORDER BY event_timestamp_kst
  ) + 1 AS new_session_id
FROM TMP
