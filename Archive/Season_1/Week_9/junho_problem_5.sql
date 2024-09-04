SELECT CASE WHEN MONTH(DIFFERENTIATION_DATE) >= 10 THEN '4Q'
            WHEN MONTH(DIFFERENTIATION_DATE) >= 7 THEN '3Q'
            WHEN MONTH(DIFFERENTIATION_DATE) >= 4 THEN '2Q'
            ELSE '1Q'
            END AS QUARTER, COUNT(*) AS ECOLI_COUNT
FROM ECOLI_DATA
GROUP BY QUARTER
ORDER BY QUARTER;