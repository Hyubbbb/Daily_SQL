SELECT
    query_name,
    ROUND(SUM(rating/position) / COUNT(query_name), 2) AS quality,
    ROUND(100*SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(query_name), 2) AS poor_query_percentage
FROM queries
GROUP BY query_name
