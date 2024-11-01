-- 나이 정보가 없는 회원 수를 조회하는 쿼리
-- https://school.programmers.co.kr/learn/courses/30/lessons/131528

SELECT 
    COUNT(*) AS USERS  -- 나이 정보가 없는 회원 수를 카운트하고 컬럼명을 USERS로 지정
FROM 
    USER_INFO
WHERE 
    AGE IS NULL;  -- AGE가 NULL인 회원을 필터링
