-- 국적 : teams.team
-- records.medal : NULL 존재

SELECT name
FROM athletes ath
  JOIN records rec 
    ON rec.athlete_id = ath.id
  JOIN games gam 
    ON gam.id = rec.game_id
WHERE rec.medal IS NOT NULL
    AND gam.year >= 2000
GROUP BY athlete_id
  HAVING COUNT(DISTINCT rec.team_id) >= 2
ORDER BY name
