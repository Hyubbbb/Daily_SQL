-- https://school.programmers.co.kr/learn/courses/30/lessons/131535
-- YEAR()함수나 EXTRACT()함수도 사용 가능.
SELECT COUNT(USER_ID) AS USERS
FROM USER_INFO
WHERE JOINED BETWEEN '2021-01-01' AND '2021-12-31'
  AND AGE BETWEEN 20 AND 29;

-- WHERE YEAR(JOINED) = 2021 AND FLOOR(AGE/10) == 2;
-- WHERE EXTRACT(YEAR FROM JOINED) = 2021 AND SUBSTRING(AGE,1,1) = 2;