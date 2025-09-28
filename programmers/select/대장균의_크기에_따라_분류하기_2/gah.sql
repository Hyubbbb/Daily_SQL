WITH e AS (
    SELECT
        id,
        PERCENT_RANK() OVER (ORDER BY size_of_colony DESC) AS size_p
    FROM
        ecoli_data
)

SELECT
    id,
    CASE
        WHEN size_p <= 0.25 THEN 'CRITICAL'
        WHEN size_p <= 0.50 THEN 'HIGH'
        WHEN size_p <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS colony_name
FROM e
ORDER BY 1;
