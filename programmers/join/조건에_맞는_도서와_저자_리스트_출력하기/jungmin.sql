-- JOIN : 조건에 맞는 도서와 저자 리스트 출력하기
SELECT
    b.book_id,
    a.author_name,
    DATE_FORMAT(b.published_date, "%Y-%m-%d") AS publish_date
FROM book AS b
    JOIN author AS a
        ON a.author_id = b.author_id
WHERE 1=1
    AND b.category = '경제'
ORDER BY b.published_date
