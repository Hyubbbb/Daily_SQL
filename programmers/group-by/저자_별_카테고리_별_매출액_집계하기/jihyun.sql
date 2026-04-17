SELECT 
    a.author_id, 
    a.author_name, 
    b.category, 
    SUM(b.price*bs.sales) AS sales
FROM book AS b
    JOIN author AS a
        ON b.author_id = a.author_id
    JOIN book_sales AS bs
        ON b.book_id = bs.book_id
WHERE 1=1
    AND sales_date > '2021-12-31'
    AND sales_date < '2022-02-01'
GROUP BY a.author_id, b.category
ORDER BY a.author_id, b.category DESC
