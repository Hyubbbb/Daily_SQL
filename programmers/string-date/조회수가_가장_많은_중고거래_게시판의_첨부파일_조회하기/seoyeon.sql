WITH max_view_board_id AS (
    SELECT
        ugb.board_id
    FROM used_goods_board AS ugb
    ORDER BY ugb.views DESC
    LIMIT 1
)

SELECT
    CONCAT('/home/grep/src/', ugf.board_id, '/', ugf.file_id, ugf.file_name, ugf.file_ext) AS file_path
FROM max_view_board_id AS mvb
    JOIN used_goods_file AS ugf
        ON ugf.board_id = mvb.board_id
ORDER BY ugf.file_id DESC;
