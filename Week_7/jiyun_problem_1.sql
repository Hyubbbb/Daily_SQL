SELECT C.name
FROM games G
JOIN companies C
ON C.company_id = G.publisher_id
GROUP BY G.publisher_id HAVING COUNT(G.publisher_id) >= 10
