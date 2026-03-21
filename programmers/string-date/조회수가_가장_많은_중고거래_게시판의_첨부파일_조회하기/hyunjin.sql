-- 코드를 입력하세요
SELECT 
   CONCAT('/home/grep/src/', uf.board_id, '/', uf.file_id, uf.file_name, uf.file_ext) AS file_path
FROM used_goods_file AS uf
  JOIN used_goods_board AS ub
    ON ub.board_id = uf.board_id
WHERE 1=1
  AND ub.views = (SELECT 
                     MAX(ub.views) 
                  FROM used_goods_board AS ub)
ORDER BY uf.file_id DESC
