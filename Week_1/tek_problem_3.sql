/* 596. Classes More Than 5 Students
https://leetcode.com/problems/classes-more-than-5-students/description/ */

SELECT class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5