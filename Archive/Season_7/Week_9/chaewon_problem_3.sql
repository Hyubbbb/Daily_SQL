-- 부서별 평균 급여가 5000 이상인 부서 (집계 후 조건)
SELECT 
    dept_name,
    COUNT(*) as emp_count,
    AVG(salary) as avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id  
WHERE e.status = 'active'  -- 집계 전 조건
GROUP BY dept_name
HAVING AVG(salary) >= 5000  -- 집계 후 조건
ORDER BY avg_salary DESC;