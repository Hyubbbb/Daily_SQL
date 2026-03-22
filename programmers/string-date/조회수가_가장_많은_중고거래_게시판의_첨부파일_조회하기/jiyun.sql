SELECT
    CONCAT('/home/grep/src/', ugf.board_id, '/', file_id, file_name, file_ext) AS file_path
FROM used_goods_file AS ugf
    INNER JOIN used_goods_board AS ugb
        ON ugf.board_id = ugb.board_id
WHERE 1=1
    AND views IN (SELECT MAX(views) FROM used_goods_board)
ORDER BY file_id DESC
