/* LeetCode The Number of Employees Which Report to Each Employee
https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/ */

SELECT e1.employee_id, e1.name, COUNT(e2.reports_to) as reports_count, ROUND(AVG(e2.age)) as average_age
FROM Employees as e1
JOIN Employees as e2
    ON e1.employee_id = e2.reports_to
-- GROUP BY e2.reports_to
GROUP BY e1.employee_id
ORDER BY e1.employee_id