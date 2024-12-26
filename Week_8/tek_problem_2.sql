/* LeetCode Game Play Analysis IV
https://leetcode.com/problems/game-play-analysis-iv/description/ */

SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) as fraction
FROM Activity as a1
INNER JOIN(
    SELECT player_id, MIN(event_date) as min_date
    FROM Activity
    GROUP BY player_id
) as a2
    ON a1.player_id = a2.player_id
WHERE a1.event_date = DATE_ADD(a2.min_date, INTERVAL 1 DAY)