WITH score_tbl AS (
    SELECT 
        emp_no,
        CASE
            WHEN AVG(score) >= 96
                THEN 'S'
            WHEN AVG(score) >= 90
                THEN 'A'
            WHEN AVG(score) >= 80
                THEN 'B'
            ELSE 'C'
        END AS grade
    FROM hr_grade
    GROUP BY emp_no
)

SELECT 
    employee.emp_no, 
    employee.emp_name, 
    score.grade,
    CASE
        WHEN score.grade = 'S'
            THEN employee.sal * 0.2
        WHEN score.grade = 'A'
            THEN employee.sal * 0.15
        WHEN score.grade = 'B'
            THEN employee.sal * 0.1
        ELSE 0
    END AS bonus
FROM hr_employees AS employee 
    JOIN score_tbl AS score
        ON employee.emp_no = score.emp_no
ORDER BY employee.emp_no
