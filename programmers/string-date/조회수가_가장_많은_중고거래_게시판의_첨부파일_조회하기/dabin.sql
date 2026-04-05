WITH max_views_board AS (
    SELECT board_id
    FROM used_goods_board
        ORDER BY views DESC
    LIMIT 1
)

SELECT
    CONCAT('/home/grep/src/', m.board_id, '/', f.file_id, f.file_name, f.file_ext) AS file_path
FROM max_views_board AS m
    JOIN used_goods_file AS f
        ON m.board_id = f.board_id
    ORDER BY f.file_id DESC;
