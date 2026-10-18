SELECT
    CONCAT(name, '(', LEFT(occupation, 1), ')') AS name_with_initial
FROM occupations
ORDER BY name;

SELECT
    CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.') AS occupation_summary
FROM occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;
