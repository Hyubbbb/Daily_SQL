SELECT
    b.category,
    SUM(bs.sales) AS total_sales
FROM book_sales AS bs
    JOIN book AS b
        ON bs.book_id = b.book_id
WHERE 1=1
    AND bs.sales_date BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY b.category
ORDER BY b.category