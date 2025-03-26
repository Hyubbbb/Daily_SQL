-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/?envType=study-plan-v2&envId=top-sql-50

SELECT
      b.unique_id
    , a.name
FROM Employees a
LEFT JOIN EmployeeUNI b
    on a.id = b.id
