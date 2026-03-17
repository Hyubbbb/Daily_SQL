WITH max_view_id AS (
    SELECT board_id
    FROM used_goods_board
    ORDER BY views DESC
    LIMIT 1
)
SELECT CONCAT('/home/grep/src/', board_id, '/', file_id, file_name, file_ext) AS file_path
FROM used_goods_file
WHERE 1=1
    AND board_id = (SELECT board_id FROM max_view_id)
ORDER BY file_id DESC