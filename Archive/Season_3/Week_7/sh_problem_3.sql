-- 조건에 맞는 도서와 저자 리스트 출력하기
SELECT book_id, author_name, date_format(published_date, '%Y-%m-%d') as pulished_date
FROM book as a join author as b on a.author_id=b.author_id 
where category="경제"
order by published_date asc