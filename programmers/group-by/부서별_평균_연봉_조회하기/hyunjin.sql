SELECT 
    he.dept_id,
    hd.dept_name_en,
    ROUND(AVG(he.sal), 0) AS AVG_SAL 
FROM hr_employees AS he
    LEFT JOIN hr_department AS hd
        ON he.dept_id = hd.dept_id
GROUP BY he.dept_id, hd.dept_name_en
ORDER BY avg_sal DESC
