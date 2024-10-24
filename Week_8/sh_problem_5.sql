-- 조건에 맞는 회원수 구하기
SELECT count(user_id) as users
FROM user_info
WHERE age>=20 and age<=29 and year(joined)=2021