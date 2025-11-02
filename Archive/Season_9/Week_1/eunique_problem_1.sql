Programmers > JOIN > 조건에 맞는 도서와 저자 리스트 출력 

SELECT
    b.book_id,
    a.author_name, 
    DATE_FORMAT(b.published_date, '%Y-%m-%d') AS published_date
FROM book as b
    JOIN author AS a
        ON b.author_id = a.author_id
WHERE 1=1
    AND b.category = '경제'
ORDER BY B.PUBLISHED_DATE ASC;
