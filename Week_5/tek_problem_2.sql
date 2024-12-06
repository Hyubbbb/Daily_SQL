/* LeetCode 1075. Project Employees I
https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT p.project_id, ROUND(SUM(e.experience_years) / COUNT(e.employee_id), 2) as average_years
FROM Project as p
LEFT JOIN Employee as e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id