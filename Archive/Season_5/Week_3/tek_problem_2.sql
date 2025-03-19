/* leetcode Medium 한 번 더 풀기
550. Game Play Analysis IV
https://leetcode.com/problems/game-play-analysis-iv/description/ */

/* 내가 만든 쿼리 */
WITH CTE AS (
    SELECT DISTINCT player_id, 
        FIRST_VALUE(event_date) OVER (PARTITION BY player_id ORDER BY event_date) as first_date,
        NTH_VALUE(event_date, 2) OVER (PARTITION BY player_id ORDER BY event_date) as second_date
    FROM Activity
    ORDER BY player_id
)

SELECT ROUND(
    AVG(CASE WHEN player_id IN (SELECT player_id FROM CTE WHERE second_date IS NOT NULL AND second_date - first_date = 1) THEN 1 ELSE 0 END), 2
    ) as fraction
FROM (SELECT DISTINCT player_id FROM Activity)


/* 다른 사람의 쿼리
SELECT ROUND(COUNT(a1.player_id)::DECIMAL / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) as fraction
FROM Activity AS a1
WHERE (a1.player_id, a1.event_date - 1) IN (
    SELECT a2.player_id, MIN(a2.event_date)
    FROM Activity AS a2
    GROUP BY a2.player_id
) 
*/