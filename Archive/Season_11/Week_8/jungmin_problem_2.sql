-- https://solvesql.com/problems/movies-about-love/
SELECT
    title,
    year,
    rotten_tomatoes
FROM movies
WHERE 1=1
    AND title LIKE ('%Love%')
    OR title LIKE ('%love%')
ORDER BY rotten_tomatoes DESC, year DESC;
