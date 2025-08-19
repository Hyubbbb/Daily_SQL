-- 연속 3일 결석한 학생 출력
SELECT DISTINCT a1.student_id, s.student_name
FROM attendance a1
JOIN attendance a2 ON a1.student_id = a2.student_id 
    AND a2.attendance_date = DATE_ADD(a1.attendance_date, INTERVAL 1 DAY)
JOIN attendance a3 ON a1.student_id = a3.student_id 
    AND a3.attendance_date = DATE_ADD(a1.attendance_date, INTERVAL 2 DAY)
JOIN students s ON a1.student_id = s.student_id
WHERE a1.status = 'absent' 
    AND a2.status = 'absent' 
    AND a3.status = 'absent';