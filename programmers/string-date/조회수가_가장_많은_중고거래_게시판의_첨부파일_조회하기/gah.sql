SELECT
    CONCAT('/home/grep/src/', gb.board_id, '/', gf.file_id, gf.file_name, gf.file_ext) AS file_path
FROM used_goods_board AS gb
    JOIN used_goods_file AS gf
        ON gb.board_id = gf.board_id
WHERE 1=1
    AND gb.views = (SELECT
                        MAX(views)
                    FROM used_goods_board)
ORDER BY gf.file_id DESC;
