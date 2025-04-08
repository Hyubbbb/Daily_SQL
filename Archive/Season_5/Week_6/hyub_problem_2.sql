-- https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50

SELECT
      name
    , bonus
FROM Employee e
LEFT JOIN Bonus b
    on e.empId = b.empId
WHERE (bonus is null) OR (bonus < 1000)
