SELECT
    CONCAT('/home/grep/src/', ugb.board_id, '/', ugf.file_id, ugf.file_name, ugf.file_ext) AS file_path
FROM used_goods_board AS ugb
  JOIN used_goods_file AS ugf
        ON ugb.board_id = ugf.board_id
WHERE 1=1
    AND ugb.views = (SELECT MAX(views)
                     FROM used_goods_board)
ORDER BY ugf.file_id DESC;
