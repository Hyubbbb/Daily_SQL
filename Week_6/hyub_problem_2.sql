-- https://solvesql.com/problems/data-without-underscore/

SELECT DISTINCT page_location
FROM ga
WHERE page_location NOT LIKE '%\_%' ESCAPE '\'
ORDER BY page_location ASC
