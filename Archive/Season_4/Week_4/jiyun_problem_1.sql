WITH TMP1 AS(
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY author, year ORDER BY year) AS RN
    FROM books
    WHERE genre='Fiction'
),

TMP2 AS(
  SELECT *,
    LAG(year,4) OVER (PARTITION BY author ORDER BY year) AS STYEAR
  FROM TMP1
  WHERE RN=1
)

SELECT DISTINCT author, 
  MAX(year) OVER (PARTITION BY author) AS year,
  COUNT(STYEAR) OVER (PARTITION BY author) + 4 AS depth
FROM TMP2
WHERE year-4=STYEAR
