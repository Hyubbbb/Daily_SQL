-- https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50
SELECT
    s1.student_id, 
    s1.student_name, 
    s2.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM students AS s1
    CROSS JOIN subjects AS s2
        LEFT JOIN examinations AS e
            ON s1.student_id = e.student_id
                AND s2.subject_name = e.subject_name
GROUP BY student_id, student_name, subject_name
ORDER BY student_id, subject_name;
