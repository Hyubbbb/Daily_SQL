SELECT
    ugb.title,
    ugb.board_id,
    ugr.reply_id,
    ugr.writer_id,
    ugr.contents,
    ugr.created_date
FROM used_goods_board AS ugb
    INNER JOIN used_goods_reply AS ugr
        ON ugb.board_id = ugr.board_id
WHERE 1=1
    AND ugb.created_date >= '2022-10-01'
    AND ugb.created_date < '2022-11-01'
ORDER BY ugr.created_date, ugb.title
