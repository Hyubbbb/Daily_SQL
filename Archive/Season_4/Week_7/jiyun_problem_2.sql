SELECT
  user_id,
  CASE
    WHEN CNT_A IS NULL THEN 0
    ELSE CNT_A
  END + CASE
    WHEN CNT_B IS NULL THEN 0
    ELSE CNT_B
  END AS num_friends
FROM
  users U
  LEFT JOIN (
    SELECT user_a_id, COUNT(user_b_id) AS CNT_A
    FROM edges
    GROUP BY user_a_id
  ) A ON U.user_id = A.user_a_id
  LEFT JOIN (
    SELECT user_b_id, COUNT(user_b_id) AS CNT_B
    FROM edges
    GROUP BY user_b_id
  ) B ON U.user_id = B.user_b_id
ORDER BY num_friends DESC, user_id
