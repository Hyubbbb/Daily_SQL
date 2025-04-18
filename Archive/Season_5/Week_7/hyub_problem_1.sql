-- https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50

SELECT
      s1.student_id
    , s1.student_name
    , s2.subject_name
    , SUM(CASE WHEN e.subject_name IS NOT NULL THEN 1 ELSE 0 END) AS attended_exams
FROM Students s1 
CROSS JOIN Subjects s2
LEFT JOIN Examinations e
    on (s1.student_id = e.student_id) AND (s2.subject_name = e.subject_name)
GROUP BY s1.student_id, s1.student_name, s2.subject_name
ORDER BY s1.student_id, s2.subject_name
