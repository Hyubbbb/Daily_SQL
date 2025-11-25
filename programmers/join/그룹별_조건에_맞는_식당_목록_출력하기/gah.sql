WITH review_cnt AS (   -- 회원별 리뷰 개수
    SELECT
        member_id,
        COUNT(*) AS cnt
    FROM rest_review
    GROUP BY member_id
),
max_reviewer AS (   -- 리뷰를 가장 많이 작성한 회원
    SELECT
        member_id
    FROM review_cnt
    WHERE 1=1
        AND cnt = (
            SELECT MAX(cnt)
            FROM review_cnt
        )
)

SELECT
    mp.member_name,
    mr.review_text,
    DATE_FORMAT(rr.review_date, '%Y-%m-%d') AS review_date
FROM max_reviewer AS mr   -- (1) 제일 많이 작성한 리뷰어
    JOIN rest_review AS rr
        ON mr.member_id = rr.member_id   -- (2) 위 리뷰어의 리뷰
    JOIN member_profile AS mp
        ON mr.member_id = mp.member_id   -- (3) 위 리뷰어의 프로필
ORDER BY
    review_date ASC,
    rr.review_text ASC;
