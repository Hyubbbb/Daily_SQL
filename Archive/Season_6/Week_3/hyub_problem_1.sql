-- https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50

WITH TMP AS (
    SELECT
        player_id
        , DATEDIFF(event_date, LAG(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date)) AS c1
        , event_date
        , ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS c2
    FROM Activity)

-- 비율 계산
SELECT ROUND(
    (SELECT COUNT(player_id) FROM TMP WHERE c2 = 2 AND c1 = 1)
    /
    (SELECT COUNT(DISTINCT player_id) FROM Activity)
    , 2) AS fraction
