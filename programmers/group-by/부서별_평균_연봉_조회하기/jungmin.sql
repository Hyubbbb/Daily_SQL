SELECT
    emp.dept_id,
    dep.dept_name_en,
    ROUND(AVG(emp.sal)) AS avg_sal
FROM hr_employees AS emp
    JOIN hr_department AS dep
        ON emp.dept_id = dep.dept_id
GROUP BY emp.dept_id
ORDER BY avg_sal DESC;
