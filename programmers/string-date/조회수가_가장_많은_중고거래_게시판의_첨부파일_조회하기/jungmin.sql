WITH max_views AS (
    SELECT *
    FROM used_goods_board AS gb
    ORDER BY gb.views DESC
    LIMIT 1
)

SELECT CONCAT('/home/grep/src/', mv.board_id, '/', gf.file_id, gf.file_name, gf.file_ext) AS file_path
FROM max_views AS mv
    JOIN used_goods_file AS gf
        ON mv.board_id = gf.board_id
ORDER BY gf.file_id DESC;
