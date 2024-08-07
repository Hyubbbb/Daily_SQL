-- [PROGRAMMERS] String, Date > 조회수가 가장 많은 중고거래 게시판의 첨부파일 조회하기

SELECT CONCAT('/home/grep/src/', b.BOARD_ID, '/', f.FILE_ID, f.FILE_NAME, f.FILE_EXT) FILE_PATH
FROM USED_GOODS_BOARD b, USED_GOODS_FILE f
WHERE b.BOARD_ID = f.BOARD_ID
  AND b.VIEWS = (SELECT MAX(VIEWS)
                 FROM USED_GOODS_BOARD)
ORDER BY f.FILE_ID DESC;
