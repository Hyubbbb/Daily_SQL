SELECT ci.name
FROM city as ci
JOIN country as co
ON ci.countrycode = co.code
WHERE co.continent = 'Africa';
