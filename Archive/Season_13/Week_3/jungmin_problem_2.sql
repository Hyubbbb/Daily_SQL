-- https://solvesql.com/problems/summary-of-artworks-in-3-years/
SELECT
    classification,
    SUM(CASE
            WHEN SUBSTR(COALESCE(acquisition_date, '2013-01-01'), 1, 4) = '2014'
                THEN 1
            ELSE 0
        END) AS `2014`,
    SUM(CASE
            WHEN SUBSTR(COALESCE(acquisition_date, '2013-01-01'), 1, 4) = '2015'
                THEN 1
            ELSE 0
        END) AS `2015`,
    SUM(CASE
            WHEN SUBSTR(COALESCE(acquisition_date, '2013-01-01'), 1, 4) = '2016'
                THEN 1
            ELSE 0
        END) AS `2016`
FROM artworks
GROUP BY classification
ORDER BY classification ASC;
