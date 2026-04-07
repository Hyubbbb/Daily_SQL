SELECT
    a.author_id,
    a.author_name,
    b.category,
    SUM(bs.sales * b.price) AS total_sales
FROM book_sales AS bs
    JOIN book AS b
        ON bs.book_id = b.book_id
    JOIN author AS a
        ON b.author_id = a.author_id
WHERE 1=1
    AND sales_date >= '2022-01-01'
    AND sales_date <  '2022-02-01'
GROUP BY a.author_id, a.author_name, b.category
ORDER BY a.author_id, b.category DESC