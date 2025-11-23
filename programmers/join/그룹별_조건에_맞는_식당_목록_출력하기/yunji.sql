WITH review_cnt AS (
    SELECT
        member_id,
        COUNT(*) AS cnt
    FROM rest_review
    GROUP BY member_id
),
max_cnt_num AS (
    SELECT MAX(cnt) AS max_cnt
    FROM review_cnt 
),
top_member AS (
    SELECT member_id
    FROM review_cnt AS rc
    JOIN max_cnt_num AS mc
        ON rc.cnt = mc.max_cnt
)

SELECT 
    mp.member_name,
    rr.review_text,
    DATE_FORMAT(rr.review_date, '%Y-%m-%d') AS review_date
FROM member_profile AS mp
JOIN rest_review AS rr
    ON mp.member_id = rr.member_id
JOIN top_member AS tm
    ON rr.member_id = tm.member_id
ORDER BY
    rr.review_date,
    rr.review_text
