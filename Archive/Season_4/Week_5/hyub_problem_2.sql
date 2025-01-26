-- https://solvesql.com/problems/number-of-friends/ 

WITH t_cnt_a AS (
  SELECT
      user_a_id
    , COUNT(*) AS cnt_a
    -- , SUM(CASE 
    --       WHEN user_b_id THEN 1
    --       ELSE 0 END) AS cnt_a
  FROM edges
  GROUP BY user_a_id),

t_cnt_b AS (
  SELECT
      user_b_id
    , COUNT(*) AS cnt_b
    -- , SUM(CASE 
    --       WHEN user_a_id THEN 1
    --       ELSE 0 END) AS cnt_b
  FROM edges
  GROUP BY user_b_id),

t_cnt_total AS(
  SELECT
      COALESCE(user_a_id, user_b_id) AS user_id
    , COALESCE(cnt_a, 0) + COALESCE(cnt_b, 0) AS num_friends
  FROM t_cnt_a a
  FULL OUTER JOIN t_cnt_b b 
    on a.user_a_id = b.user_b_id)

SELECT
    u.user_id
  , IFNULL(num_friends, 0) AS num_friends
FROM users u
LEFT JOIN t_cnt_total t
  on u.user_id = t.user_id
ORDER BY num_friends DESC, u.user_id ASC
