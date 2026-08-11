SELECT
    b.category,
    SUM(b_sal.sales) AS total_sales
FROM book_sales AS b_sal
    JOIN book AS b
        ON b_sal.book_id = b.book_id
WHERE 1=1
    AND b_sal.sales_date BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY b.category
ORDER BY b.category;
