-- https://solvesql.com/problems/multiple-medalist/
-- 2000년 이후: games의 year >= 2000
-- 메달을 수상한 선수: records의 medal IS NOT NULL
-- 2개 이상의 국적: teams 확인
SELECT a.name
FROM records AS r
    JOIN athletes AS a
        ON r.athlete_id = a.id
    JOIN games AS g
        ON r.game_id = g.id
WHERE 1=1
    AND g.year >= 2000
    AND r.medal IS NOT NULL
GROUP BY a.id, a.name
HAVING COUNT(DISTINCT r.team_id) >= 2
ORDER BY name;
