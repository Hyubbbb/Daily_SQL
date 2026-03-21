WITH max_views_board AS (
    SELECT 
        board_id
    FROM used_goods_board
    WHERE 1=1
      ORDER BY views DESC
    LIMIT 1
)

SELECT 
    CONCAT('/home/grep/src/', b.board_id, '/', f.file_id, f.file_name, f.file_ext) AS file_path
FROM used_goods_board AS b
  JOIN used_goods_file AS f 
    ON b.board_id = f.board_id
  JOIN max_views_board AS m 
    ON b.board_id = m.board_id
WHERE 1=1
ORDER BY 
    f.file_id DESC;
