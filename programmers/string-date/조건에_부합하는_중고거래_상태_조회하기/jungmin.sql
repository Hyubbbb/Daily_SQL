SELECT
    board_id,
    writer_id,
    title,
    price,
    CASE
        WHEN status = 'sale'
            THEN '판매중'
        WHEN status = 'reserved'
            THEN '예약중'
        WHEN status = 'done'
            THEN '거래완료'
    END AS status
FROM used_goods_board
WHERE 1=1
    AND created_date >= '2022-10-05'
    AND created_date < '2022-10-06'
ORDER BY board_id DESC;
