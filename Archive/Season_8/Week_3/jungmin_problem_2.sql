-- programmers / STRING, DATE 분기별 분화된 대장균의 개체 수 구하기 (LEVEL2)
SELECT
    CASE 
        WHEN MONTH(differentiation_date) BETWEEN 1 AND 3 THEN '1Q'
        WHEN MONTH(differentiation_date) BETWEEN 4 AND 6 THEN '2Q'
        WHEN MONTH(differentiation_date) BETWEEN 7 AND 9 THEN '3Q'
        WHEN MONTH(differentiation_date) BETWEEN 10 AND 12 THEN '4Q'
        END AS quarter,
    COUNT(id) AS ecoli_count
FROM ecoli_data
GROUP BY quarter
ORDER BY quarter
