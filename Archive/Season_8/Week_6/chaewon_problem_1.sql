-- https://school.programmers.co.kr/learn/courses/30/lessons/164672
SELECT 
    board_id,
    writer_id,
    title,
    price,
    CASE 
        WHEN status = 'SALE' THEN '판매중'
        WHEN status = 'RESERVED' THEN '예약중'
        WHEN status = 'DONE' THEN '거래완료'
    END AS status
FROM used_goods_board
WHERE 1=1
    AND created_date = '2022-10-05'
ORDER BY board_id DESC;