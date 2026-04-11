SELECT
   bk.author_id,
   at.author_name,
   bk.category,
   SUM((bs.sales) * (bk.price)) AS total_sales
FROM book_sales AS bs
   JOIN book AS bk
      ON bs.book_id = bk.book_id
   JOIN author AS at
      ON bk.author_id = at.author_id
WHERE 1=1
   AND bs.sales_date >= '2022-01-01'
   AND bs.sales_date < '2022-02-01'
GROUP BY bk.author_id, bk.category
ORDER BY bk.author_id, bk.category DESC
