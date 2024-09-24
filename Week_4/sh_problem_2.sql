-- 조건에 부합하는 중고거래 댓글 조회하기
SELECT title, used_goods_board.board_id, reply_id, used_goods_reply.writer_id, used_goods_reply.contents, date_format(used_goods_reply.created_date,'%Y-%m-%d') as created_date
FROM used_goods_board, used_goods_reply
WHERE used_goods_board.board_id=used_goods_reply.board_id 
and year(used_goods_board.created_date)=2022 and month(used_goods_board.created_date)=10
ORDER BY created_date asc, title asc