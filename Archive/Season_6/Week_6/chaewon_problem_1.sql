SELECT 
    department,
    COUNT(*) as total_employees,
    COUNT(CASE WHEN gender = 'female' THEN 1 END) as female_count,
    ROUND(COUNT(CASE WHEN gender = 'female' THEN 1 END) * 100.0 / COUNT(*), 2) as female_ratio
FROM employees
GROUP BY department
HAVING COUNT(CASE WHEN gender = 'female' THEN 1 END) * 100.0 / COUNT(*) >= 30
ORDER BY female_ratio DESC;