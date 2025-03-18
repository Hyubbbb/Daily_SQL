-- https://school.programmers.co.kr/learn/courses/30/lessons/131115
-- select안에 또 select..귀찮은 언어다
SELECT
*
from FOOD_PRODUCT
where price = (select
                max(price)
               from FOOD_PRODUCT)
;
