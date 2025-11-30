WITH review_count AS (
    SELECT
        member_id,
        COUNT(*) AS review_cnt
    FROM rest_review
    GROUP BY
        member_id
),
max_count AS (
    SELECT
        MAX(review_cnt) AS max_review_cnt
    FROM review_count
)
SELECT
    mp.member_name                         AS member_name,
    rr.review_text                         AS review_text,
    TO_CHAR(rr.review_date, 'YYYY-MM-DD')  AS review_date
FROM member_profile AS mp
JOIN rest_review AS rr
    ON rr.member_id = mp.member_id
JOIN review_count AS rc
    ON rc.member_id = mp.member_id
JOIN max_count AS mc
    ON rc.review_cnt = mc.max_review_cnt
WHERE 1=1
ORDER BY
    rr.review_date ASC,
    rr.review_text ASC;
