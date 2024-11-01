SELECT earnings, COUNT(*) AS number
FROM (SELECT name, months*salary AS earnings
      FROM employee) A
WHERE earnings = (SELECT MAX(months*salary) FROM employee)
GROUP BY earnings
