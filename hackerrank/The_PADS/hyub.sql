SELECT
    CONCAT(name, '(', LEFT(occupation, 1), ')')
FROM occupations
ORDER BY name;
SELECT
    CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.') AS s1
FROM occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;