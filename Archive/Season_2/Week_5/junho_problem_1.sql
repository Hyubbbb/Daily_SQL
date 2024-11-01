SELECT co.continent, FLOOR(AVG(ci.population))
FROM country as co
JOIN city as ci
ON co.code = ci.countrycode
GROUP BY 1;
