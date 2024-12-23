WITH genre_score AS (
  SELECT genre_id,
        ROUND(AVG(critic_score),3) AS critic_score,
        CEIL(AVG(critic_count)) AS critic_count,
        ROUND(AVG(user_score),3) AS user_score,
        CEIL(AVG(user_count)) AS user_count
  FROM games
  GROUP BY genre_id
)

SELECT
  game_id,
  name,
  COALESCE(G.critic_score,S.critic_score) AS critic_score,
  COALESCE(G.critic_count,S.critic_count) AS critic_count,
  COALESCE(G.user_score,S.user_score) AS user_score,
  COALESCE(G.user_count,S.user_count) AS user_count
FROM games G
JOIN genre_score S
ON G.genre_id = S.genre_id
WHERE year >= 2015
  AND (G.critic_score IS NULL OR G.user_score IS NULL)
