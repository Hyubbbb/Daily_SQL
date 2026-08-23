SELECT 
    CONCAT(QUARTER(differentiation_date), 'Q') AS quarter,
    COUNT(*) AS ecoli_count
FROM ecoli_data
GROUP BY QUARTER(differentiation_date)
ORDER BY QUARTER(differentiation_date);
