WITH t1 AS (
    SELECT
        student_id,
        subject_name,
        COUNT(subject_name) AS attended_exams
    FROM examinations
    GROUP BY student_id, subject_name
)

SELECT 
    S1.student_id,
    S1.student_name,
    S1.subject_name,
    COALESCE(T1.attended_exams, 0) AS attended_exams
FROM (SELECT * FROM students CROSS JOIN subjects) S1
    LEFT JOIN t1 T1 ON S1.student_id = T1.student_id AND S1.subject_name = T1.subject_name
ORDER BY S1.student_id, S1.subject_name
