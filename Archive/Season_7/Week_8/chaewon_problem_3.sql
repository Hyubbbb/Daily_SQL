-- 각 부서별로 급여 상위 2명씩 출력
SELECT dept_name, emp_name, salary, dept_rank
FROM (
    SELECT 
        d.dept_name,
        e.emp_name,
        e.salary,
        RANK() OVER (PARTITION BY d.dept_id ORDER BY e.salary DESC) as dept_rank
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
) ranked
WHERE dept_rank <= 2
ORDER BY dept_name, dept_rank;