조건에 맞는 회원수 구하기 | https://school.programmers.co.kr/learn/courses/30/lessons/131535


SELECT COUNT(*)  AS USERS
FROM USER_INFO
WHERE (joined 
    BETWEEN '2021-01-01' AND '2021-12-31')
        AND
    (age BETWEEN 20 AND 29)


------------------------------------

SELECT COUNT(*) as USERS
FROM USER_INFO
WHERE  
    JOINED LIKE '2021%'
    AND AGE BETWEEN 20 AND 29
