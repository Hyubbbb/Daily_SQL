-- https://school.programmers.co.kr/learn/courses/30/lessons/144854
SELECT
    b.book_id as BOOK_ID,
    a.author_name as AUTHOR_NAME,
    date_format(b.published_date, '%Y-%m-%d') as PUBLUSHED_DATE
from book as b
    inner join author as a
        on b.author_id = a.author_id
where
    b.category = '경제'
order by b.published_date
