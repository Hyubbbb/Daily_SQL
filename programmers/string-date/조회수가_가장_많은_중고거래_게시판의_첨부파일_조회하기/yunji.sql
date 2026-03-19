WITH max_view AS (
    SELECT *
    FROM used_goods_board AS ugb
    ORDER BY ugb.views DESC
    LIMIT 1
)

SELECT CONCAT('/home/grep/src/', mv.board_id, '/', ugf.file_id, ugf.file_name, ugf.file_ext) AS file_path
FROM max_view AS mv
    JOIN used_goods_file AS ugf
        ON mv.board_id = ugf.board_id
ORDER BY ugf.file_id DESC;
