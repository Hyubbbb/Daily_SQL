SELECT 
    book_id, 
    published_date
FROM book
WHERE 1=1
    AND category = '인문'
    AND published_date >= '2021-01-01'
    AND published_date < '2022-01-01'
ORDER BY published_date