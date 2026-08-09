SELECT
    hd.dept_id AS dept_id,
    hd.dept_name_en AS dept_name_en,
    ROUND(AVG(he.sal), 0) AS avg_sal
FROM hr_department AS hd
    INNER JOIN hr_employees AS he
        ON hd.dept_id = he.dept_id
GROUP BY
    hd.dept_id,
    hd.dept_name_en
ORDER BY avg_sal DESC;
