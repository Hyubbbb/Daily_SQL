# --https://school.programmers.co.kr/learn/courses/30/lessons/144854

SELECT b.book_id, a.author_name, TO_CHAR(b.published_date, 'YYYY-MM-DD') AS published_date
FROM book AS b
    JOIN author AS a
        ON b.author_id = a.author_id
WHERE 1=1
    AND b.category = '경제'
ORDER BY b.published_date
