-- 조건에 맞는 회원수 구하기(programmers)
SELECT COUNT(*) AS USER
FROM USER_INFO
WHERE AGE >= 20 AND AGE <= 29 AND YEAR(JOINED)=2021
