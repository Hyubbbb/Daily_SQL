-- https://school.programmers.co.kr/learn/courses/30/lessons/131120
-- Date format 형식 복습하기
SELECT member_id, member_name, gender, DATE_FORMAT(date_of_birth, '%Y-%m-%d') AS date_of_birth
FROM member_profile
WHERE gender = 'W' 
    AND MONTH(DATE_OF_BIRTH) = 3
    AND TLNO IS NOT NULL
ORDER BY member_id asc;
