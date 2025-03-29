SELECT SUM(CITY.Population) AS TotalPopulation
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Asia'
