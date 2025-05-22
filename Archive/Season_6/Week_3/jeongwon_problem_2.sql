-- 조회수가 가장 많은 중고거래 게시판의 첨부파일 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/164671

SELECT 
    CONCAT('/home/grep/src/', f.BOARD_ID, '/', f.FILE_ID, f.FILE_NAME, f.FILE_EXT) 
    AS FILE_PATH
FROM USED_GOODS_FILE f
JOIN USED_GOODS_BOARD b ON f.BOARD_ID = b.BOARD_ID
WHERE b.VIEWS = (
    SELECT MAX(VIEWS)
    FROM USED_GOODS_BOARD
)
ORDER BY f.FILE_ID DESC;
