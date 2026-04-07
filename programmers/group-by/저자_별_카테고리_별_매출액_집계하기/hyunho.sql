SELECT
    a.author_id,
    a.author_name,
    b.category,
    SUM(bs.sales * b.price) AS total_sales
FROM book as b
    JOIN author as a
        ON b.author_id = a.author_id
    JOIN book_sales as bs
        ON b.book_id = bs.book_id
WHERE 1=1
    AND bs.sales_date >= '2022-01-01'
    AND bs.sales_date < '2022-02-01'
GROUP BY a.author_name, b.category
ORDER BY a.author_id, b.category DESC