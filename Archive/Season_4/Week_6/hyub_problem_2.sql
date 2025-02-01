-- https://solvesql.com/problems/friend-group-of-3/

SELECT
  ea.user_a_id AS user_a_id,
  ea.user_b_id AS user_b_id,
  eb.user_b_id AS user_c_id
FROM edges ea
JOIN edges eb
  on ea.user_b_id = eb.user_a_id
JOIN edges ec
  on (ea.user_a_id = ec.user_a_id) AND (eb.user_b_id = ec.user_b_id)
WHERE 
  ea.user_a_id = 3820
  OR ea.user_b_id = 3820
  OR eb.user_b_id = 3820
