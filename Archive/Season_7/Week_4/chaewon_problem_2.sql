-- Search Category Analysis
SELECT 
    category,
    EXTRACT(MONTH FROM search_date) AS month,
    COUNT(*) AS total_searches
FROM searches s
JOIN search_categories sc ON s.search_id = sc.search_id
WHERE EXTRACT(YEAR FROM search_date) = 2024
GROUP BY category, EXTRACT(MONTH FROM search_date)
ORDER BY total_searches DESC;