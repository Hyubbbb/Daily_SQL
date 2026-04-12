WITH book_sales_summary AS (
  SELECT
    bs.book_id AS book_id,
    SUM(bs.sales) AS sales_total
  FROM book_sales AS bs
  WHERE 1=1
    AND bs.sales_date >= '2022-01-01'
    AND bs.sales_date < '2022-02-01'
  GROUP BY
    book_id
)

SELECT
  b.author_id AS author_id,
  a.author_name AS author_name,
  b.category AS category,
  SUM(b.price * bss.sales_total) AS total_sales
FROM book AS b
  INNER JOIN author AS a
    ON b.author_id = a.author_id
  INNER JOIN book_sales_summary AS bss
    ON b.book_id = bss.book_id
WHERE 1=1
GROUP BY
  author_id,
  author_name,
  category
ORDER BY author_id, category DESC;
