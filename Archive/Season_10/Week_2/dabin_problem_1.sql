-- 3월에 태어난 여성 회원 목록 출력하기(윤다빈)
SELECT
    member_id,
    member_name,
    gender,
    DATE_FORMAT(STR_TO_DATE(date_of_birth, '%Y-%m-%d'), '%Y-%m-%d') AS date_of_birth
FROM member_profile
WHERE
    gender = 'W'
    AND SUBSTR(date_of_birth, 6, 2) = '03'
    AND tlno IS NOT NULL
ORDER BY member_id ASC;
