-- WITH max_review AS(
--     SELECT member_id
--     FROM rest_review
--     GROUP BY member_id
--     ORDER BY COUNT(*) DESC
--     LIMIT 1
-- )

-- SELECT
--     member_name,
--     review_text, 
--     DATE_FORMAT(review_date, '%Y-%m-%d') AS review_date
-- FROM rest_review AS r
--     JOIN max_review AS m1
--         ON r.member_id = m1.member_id
--     JOIN member_profile AS m2
--         ON m2.member_id = r.member_id
-- ORDER BY 
--     review_date,
--     review_text;

WITH rnk_review AS (
    SELECT 
        member_id,
        COUNT(review_id) AS cnt_review,
        RANK() OVER (ORDER BY COUNT(review_id) DESC) AS rnk
    FROM rest_review
    GROUP BY member_id
),
max_member AS (
    SELECT member_id
    FROM rnk_review
    WHERE 1=1
        AND rnk=1
)

SELECT
    member_name,
    review_text,
    DATE_FORMAT(review_date, '%Y-%m-%d') AS review_date
FROM rest_review AS rr
    JOIN max_member AS mm
        ON rr.member_id = mm.member_id
    JOIN member_profile AS mp
        ON mp.member_id = rr.member_id
ORDER BY 
    rr.review_date, rr.review_text;
