-- https://school.programmers.co.kr/learn/courses/30/lessons/131118
-- 오답노트: 서울%를 서울특별시%로 적었다(네 맞아요 화나서 쓰는거에요)
-- order by에서 round 할 필요 없지 않을까
SELECT
    info.REST_ID as REST_ID,
    info.rest_name as REST_NAME,
    info.food_type as FOOD_TYPE,
    info.favorites as FAVORITES,
    info.address as ADDRESS,
    round(avg(review.review_score), 2) as SCORE
from rest_info as info
    inner join rest_review as review
        on info.rest_id = review.rest_id
where info.address like '서울%'
group by review.rest_id
order by round(avg(review.review_score), 2) DESC, info.favorites DESC
;