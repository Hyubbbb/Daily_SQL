-- https://solvesql.com/problems/find-steadyseller-writers/

WITH books_cnt AS(
  SELECT 
    author, 
    year,
    COUNT(*)

  FROM books
  WHERE genre = 'Fiction'
  GROUP BY author, year),

books_grp AS(
  SELECT 
      author,
      year,
      year - ROW_NUMBER() OVER (PARTITION BY author ORDER BY year) AS grp
  FROM books_cnt),

books_streak AS(
  SELECT 
    author,
    grp,
    COUNT(*) AS depth,
    MAX(year) AS year_max
  FROM books_grp
  GROUP BY author, grp)

SELECT
  author,
  year_max AS year,
  depth
FROM books_streak
WHERE depth >= 5
