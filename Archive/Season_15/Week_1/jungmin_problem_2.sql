-- https://datalemur.com/questions/frequent-callers
WITH call_records AS (
    SELECT
        policy_holder_id,
        COUNT(case_id) AS call_count
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3
)

SELECT COUNT(policy_holder_id) AS policy_holder_count
FROM call_records;
