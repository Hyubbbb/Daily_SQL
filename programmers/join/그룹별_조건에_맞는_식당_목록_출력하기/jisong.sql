SELECT
    mp.member_name       AS member_name,
    rr.review_text       AS review_text,
    TO_CHAR(rr.review_date, 'YYYY-MM-DD') AS review_date
FROM member_profile AS mp
JOIN rest_review AS rr
    ON rr.member_id = mp.member_id
WHERE 1=1
    AND rr.member_id = (
        SELECT
            member_id
        FROM rest_review
        GROUP BY member_id
        ORDER BY COUNT(*) DESC
        FETCH FIRST 1 ROWS ONLY
    )
ORDER BY
    rr.review_date ASC,
    rr.review_text ASC;
