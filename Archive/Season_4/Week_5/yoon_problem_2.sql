select *
from tips
where total_bill in (select max(total_bill) from tips group by day)
