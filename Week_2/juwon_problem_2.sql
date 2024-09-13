-- 프로그래머스 문제 출처: https://school.programmers.co.kr/learn/courses/30/lessons/131535
-- 2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원의 수를 조회하는 쿼리

SELECT COUNT(*) AS USERS
FROM USER_INFO
WHERE YEAR(JOINED) = 2021
AND AGE BETWEEN 20 AND 29;
