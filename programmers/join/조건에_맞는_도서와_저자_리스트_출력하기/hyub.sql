SELECT
    b.book_id,
    a.author_name,
    DATE_FORMAT(b.published_date, '%Y-%m-%d') AS published_date
FROM book AS b
    JOIN author AS a
        ON b.author_id = a.author_id
WHERE 1=1
    AND b.category = '경제'
ORDER BY published_date