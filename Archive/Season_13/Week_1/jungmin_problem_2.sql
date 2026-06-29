-- https://solvesql.com/problems/data-without-underscore/
SELECT DISTINCT(page_location)
FROM ga
WHERE 1=1
    AND page_location NOT LIKE ('%\_%')
ORDER BY page_location
