SELECT
  MAX(salary) AS "SecondHighestSalary"
FROM Employee
WHERE 1=1
  AND salary NOT IN (
    SELECT
      MAX(salary)
    FROM Employee
  )
