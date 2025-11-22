-- programmers (String, Date) : 조건에 부합하는 중고거래 상태 조회하기 (LEVEL 2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/164672
SELECT
    board_id,
    writer_id,
    title,
    price,
    CASE status
        WHEN 'sale' THEN '판매중'
        WHEN 'reserved' THEN '예약중'
        WHEN 'done' THEN '거래완료'
    END AS status
FROM used_goods_board
WHERE 1=1
    AND created_date IN ('2022-10-05')
ORDER BY board_id DESC;
