-- https://solvesql.com/problems/publisher-with-many-games/
WITH top_publisher AS (
    SELECT publisher_id
    FROM games
    GROUP BY publisher_id
    HAVING COUNT(publisher_id) >= 10
)
SELECT comp.name
FROM top_publisher AS pub
    JOIN companies AS comp
        ON pub.publisher_id = comp.company_id
