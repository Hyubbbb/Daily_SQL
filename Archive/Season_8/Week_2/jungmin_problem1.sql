-- JOIN : 조건에 맞는 도서와 저자 리스트 출력하기
SELECT
    b.book_id,
    a.author_name,
    date_format(b.published_date, "%Y-%m-%d") as publish_date
FROM 
    book as b
    JOIN author as a
        ON a.author_id = b.author_id
WHERE b.category = '경제'
ORDER BY b.published_date ASC
