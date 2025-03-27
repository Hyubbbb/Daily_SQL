-- https://school.programmers.co.kr/learn/courses/30/lessons/144855
-- 01. where는 by앞에 와야함 (syntax error)
-- 02. 한 번 이름을 as로 선언해주면, 그 뒤로 걍 그거 써도 됨 (여기선 CATEGORY)
-- 03. count(*)가 아니라 sum(s.sales) 써주기!
SELECT
    b.category as CATEGORY,
    sum(s.sales) as TOTAL_SALES
from book as b
    inner join book_sales as s
        on b.book_id = s.book_id
where year(s.sales_date) = 2022 and month(s.sales_date) = 1
group by CATEGORY
order by CATEGORY
;