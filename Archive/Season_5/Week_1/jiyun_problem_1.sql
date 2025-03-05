SELECT
  A.employee_id AS mentee_id
  ,A.name AS mentee_name
  ,B.employee_id AS mentor_id
  ,B.name AS mentor_name
FROM (
  SELECT * FROM employees WHERE join_date > '2021-09-30'
  ) A
LEFT JOIN (
  SELECT * FROM employees WHERE join_date < '2019-12-31'
) B
WHERE A.department != B.department
ORDER BY mentee_id, mentor_id
