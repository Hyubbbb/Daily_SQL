-- https://school.programmers.co.kr/learn/courses/30/lessons/133027
with july_total_order as (
select 
    flavor as july_flavor,
    sum(total_order) as july_total_order
from july 
group by flavor
)

select 
    f.flavor
from first_half as f
    join july_total_order as jt 
        on f.flavor = jt.july_flavor
order by (f.total_order + jt.july_total_order) desc
limit 3
;