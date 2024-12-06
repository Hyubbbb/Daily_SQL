-- https://solvesql.com/problems/publisher-with-many-games/
SELECT COM.name
FROM companies COM
JOIN games GAM
ON COM.company_id = GAM.publisher_id
GROUP BY COM.company_id
HAVING COUNT(GAM.game_id) >= 10;