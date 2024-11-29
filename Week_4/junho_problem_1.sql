SELECT project_id, AVG(experience_years) as average_years
FROM Project as p
JOIN Employee as e
ON p.employee_id = e.employee_id
GROUP BY project_id;
