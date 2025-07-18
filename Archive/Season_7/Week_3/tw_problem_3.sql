SELECT c.student_id, c.student_name, b.subject_name, COUNT(a.subject_name) AS "attended_exams"
FROM Students c
CROSS JOIN Subjects b 
-- 세 과목명은 무조건 포함되어야 하기에
-- CROSS JOIN이 아니면 0인 값이 포함이 안됨

LEFT JOIN Examinations a
  ON a.student_id = c.student_id AND a.subject_name = b.subject_name

-- 따라서 GROUP BY에서도 세 과목을 모두 포함하기 위해 Subjects b 테이블 컬럼을 기준으로 묶어주기
GROUP BY c.student_id, c.student_name, b.subject_name
ORDER BY c.student_id, b.subject_name
