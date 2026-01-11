SELECT 
  b.book_id,
  a.author_name,
  DATE_FORMAT(b.published_date, '%Y-%m-%d') as published_date
FROM book AS b
  JOIN author AS a
    ON a.author_id = b.author_id
WHERE b.category = '경제'
ORDER BY b. published_date
