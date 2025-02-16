SELECT 
  AB.user_a_id, 
  AB.user_b_id, 
  BC.user_b_id AS user_c_id
FROM edges AB
  JOIN edges BC ON AB.user_b_id=BC.user_a_id
  JOIN edges CA ON BC.user_b_id=CA.user_b_id
WHERE AB.user_a_id=CA.user_a_id 
  AND (AB.user_a_id = 3820 OR AB.user_b_id = 3820 OR BC.user_b_id = 3820)
