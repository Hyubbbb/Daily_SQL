-- https://school.programmers.co.kr/learn/courses/30/lessons/164671

WITH TopPost AS (
    SELECT 
        BOARD_ID
    FROM 
        USED_GOODS_BOARD
    WHERE 
        VIEWS = (SELECT MAX(VIEWS) FROM USED_GOODS_BOARD)
)
SELECT 
    CONCAT('/home/grep/src/', UF.BOARD_ID, '/', UF.FILE_ID, UF.FILE_NAME, UF.FILE_EXT) AS FILE_PATH
FROM 
    USED_GOODS_FILE UF
JOIN 
    TopPost TP ON UF.BOARD_ID = TP.BOARD_ID
ORDER BY 
    UF.FILE_ID DESC;