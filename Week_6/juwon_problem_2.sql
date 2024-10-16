-- 12세 이하인 여자 환자 목록을 조회하는 쿼리
-- https://school.programmers.co.kr/learn/courses/30/lessons/132201 

SELECT
    PT_NAME,               -- 환자 이름
    PT_NO,                 -- 환자 번호
    GEND_CD,               -- 성별 코드
    AGE,                   -- 나이
    COALESCE(TLNO, 'NONE') AS TLNO  -- 전화번호가 NULL인 경우 'NONE'으로 출력
FROM
    PATIENT
WHERE
    GEND_CD = 'W'          -- 여자 환자 필터링
    AND AGE <= 12          -- 12세 이하 환자 필터링
ORDER BY
    AGE DESC,              -- 나이를 기준으로 내림차순 정렬
    PT_NAME ASC;           -- 나이가 같다면 환자 이름을 오름차순 정렬
