SELECT
    b.category,
    SUM(b_sal.sales) AS total_sales
FROM book AS b
    JOIN book_sales AS b_sal
        ON b.book_id = b_sal.book_id
WHERE 1=1
    AND b_sal.sales_date BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY category
ORDER BY category;