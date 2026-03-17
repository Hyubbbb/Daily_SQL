WITH max_view_board_id AS (
    SELECT
        b.board_id
    FROM used_goods_board AS b
    ORDER BY b.views DESC
    LIMIT 1
)

SELECT
    CONCAT('/home/grep/src/', f.board_id, '/', f.file_id, f.file_name, f.file_ext) AS file_path
FROM max_view_board_id AS mv
    JOIN used_goods_file AS f
        ON f.board_id = mv.board_id
ORDER BY f.file_id DESC