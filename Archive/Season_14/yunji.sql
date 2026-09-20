-- LEVEL 1, 나이 정보가 없는 회원 수 구하기
SELECT
    COUNT(user_id) AS users
FROM user_info
WHERE age IS NULL
