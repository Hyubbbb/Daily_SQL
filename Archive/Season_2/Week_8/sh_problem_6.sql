-- 나이 정보가 없는 회원 수 구하기
SELECT count(user_id) as users
FROM user_info
WHERE age is null