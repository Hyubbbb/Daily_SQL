-- 12세 이하인 여자 환자 목록 출력하기
SELECT pt_name, pt_no, gend_cd, age, IFNULL(tlno, "NONE") as tlno
FROM patient
WHERE age <= 12 and gend_cd="W"
ORDER BY age desc, pt_name asc