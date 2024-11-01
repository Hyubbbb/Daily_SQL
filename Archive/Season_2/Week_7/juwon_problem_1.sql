-- 조건에 부합하는 중고거래 댓글 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/164673

SELECT 
    UGB.TITLE,          -- 게시글 제목
    UGB.BOARD_ID,       -- 게시글 ID
    UGR.REPLY_ID,       -- 댓글 ID
    UGR.WRITER_ID,      -- 댓글 작성자 ID
    UGR.CONTENTS,       -- 댓글 내용
    TO_CHAR(UGR.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE  -- 댓글 작성일 (포맷: YYYY-MM-DD)
FROM 
    USED_GOODS_BOARD UGB
JOIN 
    USED_GOODS_REPLY UGR 
ON 
    UGB.BOARD_ID = UGR.BOARD_ID
WHERE 
    UGB.CREATED_DATE BETWEEN TO_DATE('2022-10-01', 'YYYY-MM-DD') 
                         AND TO_DATE('2022-10-31', 'YYYY-MM-DD')  -- 2022년 10월 작성된 게시글 필터링
ORDER BY 
    UGR.CREATED_DATE ASC,  -- 댓글 작성일 기준 오름차순 정렬
    UGB.TITLE ASC;         -- 댓글 작성일이 같다면 게시글 제목 기준 오름차순 정렬
