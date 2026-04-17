-- 저자 별 카테고리 별 매출액 집계하기
SELECT
    a.author_id,
    a.author_name,
    b.category,
    SUM(b.price * bs.sales) AS total_sales
FROM book AS b
    JOIN author AS a
        ON b.author_id = a.author_id
    JOIN book_sales AS bs
        ON b.book_id = bs.book_id
WHERE 1=1
  AND bs.sales_date >= '2022-01-01'
  AND bs.sales_date < '2022-02-01'
GROUP BY
    b.author_id,
    a.author_name,
    b.category
ORDER BY b.author_id,b.category DESC;
