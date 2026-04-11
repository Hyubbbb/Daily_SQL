SELECT 
    author.author_id, 
    author.author_name, 
    book.category, 
    SUM(book.price*bsales.sales) AS sales
FROM book
    JOIN author
        ON book.author_id = author.author_id
    JOIN book_sales AS bsales
        ON book.book_id = bsales.book_id
WHERE 1=1
    AND sales_date > '2021-12-31'
    AND sales_date < '2022-02-01'
GROUP BY author_id, category
ORDER BY author_id, category DESC
