-- https://solvesql.com/problems/predict-game-scores-1/

-- 1. 장르별 평균 계산 
  -- critic_score	critic_count	user_score	user_count
-- 2. Imputation

WITH TMP AS
  (SELECT 
    genre_id,
    ROUND(AVG(critic_score), 3) AS critic_score,
    CEIL(AVG(critic_count)) AS critic_count,
    ROUND(AVG(user_score), 3) AS user_score,
    CEIL(AVG(user_count)) AS user_count
  FROM games
  GROUP BY genre_id)

SELECT 
  g.game_id,
  g.name,
  COALESCE(g.critic_score, t.critic_score) AS critic_score,
  COALESCE(g.critic_count, t.critic_count) AS critic_count,
  COALESCE(g.user_score, t.user_score) AS user_score,
  COALESCE(g.user_count,t.user_count) AS user_count
FROM games g
LEFT JOIN TMP t
  on g.genre_id = t.genre_id
WHERE year >= 2015
  AND (g.critic_score IS NULL 
        OR g.user_score IS NULL)
