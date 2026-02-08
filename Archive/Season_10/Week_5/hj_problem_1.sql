-- https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&envId=top-sql-50
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM project p
    JOIN employee e
        ON p.employee_id = e.employee_id
GROUP BY p.project_id;
