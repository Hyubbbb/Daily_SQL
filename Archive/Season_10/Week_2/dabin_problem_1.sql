-- 3월에 태어난 여성 회원 목록 출력하기(윤다빈)
SELECT
    mp.member_id,
    mp.member_name,
    mp.gender,
    DATE_FORMAT(
        STR_TO_DATE(mp.date_of_birth, '%Y-%m-%d'),
        '%Y-%m-%d'
    ) AS date_of_birth
FROM member_profile AS mp
WHERE 1=1
    AND mp.gender = 'W'
    AND SUBSTR(mp.date_of_birth, 6, 2) = '03'
    AND mp.tlno IS NOT NULL
ORDER BY mp.member_id ASC;
