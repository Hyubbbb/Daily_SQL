SELECT CONCAT('/home/grep/src/',BOARD_ID,'/',FILE_ID,FILE_NAME,FILE_EXT) AS FILE_PATH
FROM USED_GOODS_FILE
WHERE BOARD_ID = (SELECT b.BOARD_ID
                    FROM USED_GOODS_BOARD AS b
                    JOIN USED_GOODS_FILE AS f
                    ON b.BOARD_ID = f.BOARD_ID
                    ORDER BY VIEWS DESC
                    LIMIT 1)
ORDER BY FILE_ID DESC;
