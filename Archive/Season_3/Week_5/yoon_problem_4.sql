SELECT title
FROM film
WHERE rating IN ('R', 'NC-17')
AND title NOT LIKE '%A'
AND title NOT LIKE '%E'
AND title NOT LIKE '%I'
AND title NOT LIKE '%O'
AND title NOT LIKE '%U';
