SELECT
    hd.dept_id,
    hd.dept_name_en,
    ROUND(AVG(he.sal), 0) AS avg_sal
FROM hr_employees AS he
    JOIN hr_department AS hd
        ON he.dept_id = hd.dept_id
GROUP BY hd.dept_id, hd.dept_name_en
ORDER BY avg_sal DESC