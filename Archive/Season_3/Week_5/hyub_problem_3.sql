-- https://solvesql.com/problems/film-ending-with-consonant/

SELECT title
FROM film
WHERE rating NOT IN ('G', 'PG', 'PG-13')
  -- AND title NOT REGEXP '[AEIOU]$'
  AND title NOT LIKE '%A'
  AND title NOT LIKE '%E'
  AND title NOT LIKE '%I'
  AND title NOT LIKE '%O'
  AND title NOT LIKE '%U'
