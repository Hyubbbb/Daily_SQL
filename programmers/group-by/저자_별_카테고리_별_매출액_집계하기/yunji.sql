SELECT 
    a.author_id,
    a.author_name,
    b.category,
    SUM(bs.sales * b.price) AS total_sales
FROM book_sales AS bs
    INNER JOIN book AS b
        ON bs.book_id = b.book_id
    INNER JOIN author AS a
        ON a.author_id = b.author_id
WHERE 1=1
    AND bs.sales_date BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY a.author_id, b.category
ORDER BY a.author_id, b.category DESC;
