-- 조건에 맞는 도서 리스트 출력하기
SELECT book_id, DATE_FORMAT(published_date, '%Y-%m-%d') as published_date
FROM book
WHERE category="인문" and year(published_date)=2021
ORDER BY published_date asc