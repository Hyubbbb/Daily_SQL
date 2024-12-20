-- 3월에 태어난 여성 회원 목록 출력하기
SELECT member_id, member_name, gender, date_format(date_of_birth, "%Y-%m-%d") as date_of_birth
FROM member_profile
WHERE month(date_of_birth)=3 and tlno is not null and gender="W"
order by member_id asc