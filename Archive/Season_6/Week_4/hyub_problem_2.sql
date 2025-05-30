-- https://leetcode.com/problems/classes-with-at-least-5-students/?envType=study-plan-v2&envId=top-sql-50

SELECT
      class
FROM Courses
GROUP BY class
    HAVING COUNT(*) >= 5
