/* 프로그래머스 PCSQL 모의고사 1번 오래된 테이블 합치기
https://campus.programmers.co.kr/tryouts/145419/challenges */

SELECT *
FROM (
    SELECT NP.ID, NP.CREATOR, NP.LIKES
    FROM NEW_POSTS AS NP
    UNION ALL
    SELECT OP.ID, OP.CREATOR, 0 AS LIKES
    FROM OLD_POSTS AS OP
) AS U
ORDER BY ID DESC