-- https://school.programmers.co.kr/learn/courses/30/lessons/164673
SELECT
    brd.title,
    brd.board_id,
    rpy.reply_id,
    rpy.writer_id,
    rpy.contents,
    DATE_FORMAT(rpy.created_date, "%Y-%m-%d") as created_date
FROM used_goods_board BRD
JOIN used_goods_reply RPY
    ON brd.board_id = rpy.board_id
WHERE YEAR(brd.created_date) = 2022
    AND MONTH(brd.created_date) = 10
ORDER BY rpy.created_date, brd.title;
