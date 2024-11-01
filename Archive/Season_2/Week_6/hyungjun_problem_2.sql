조건에 맞는 도서 리스트 출력하기 | https://school.programmers.co.kr/learn/courses/30/lessons/144853

select BOOK_ID, date_format(PUBLISHED_DATE, '%Y-%m-%d') PUBLISHED_DATE
from book
where PUBLISHED_DATE like '2021%'
    and CATEGORY in ('인문')
order by PUBLISHED_DATE;
