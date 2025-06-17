-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50

SELECT 
    e1.employee_id,
    e1.name,
    COUNT(e2.reports_to) AS reports_count,
    ROUND(AVG(e2.age)) AS average_age
FROM Employees e1
JOIN Employees e2
    ON e1.employee_id = e2.reports_to
GROUP BY employee_id
ORDER BY employee_id
