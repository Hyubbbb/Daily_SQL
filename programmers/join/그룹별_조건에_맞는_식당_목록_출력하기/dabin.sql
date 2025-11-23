-- 그룹별 조건에 맞는 식당 목록 출력하기 (윤다빈) 
SELECT
    mp.member_name,
    rr.review_text,
    DATE_FORMAT(rr.review_date, '%Y-%m-%d') AS review_date
FROM member_profile AS mp
    JOIN rest_review AS rr
        ON mp.member_id = rr.member_id
WHERE 1 = 1
  AND rr.member_id = (
        SELECT
            member_id
        FROM rest_review
        GROUP BY member_id
        ORDER BY COUNT(*) DESC,
                 member_id ASC 
        LIMIT 1
    )
ORDER BY
    rr.review_date ASC,
    rr.review_text ASC;
