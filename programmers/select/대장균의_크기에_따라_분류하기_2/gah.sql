WITH e AS (
    SELECT
        id,
        PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) pr
    FROM
        ECOLI_DATA
)

SELECT
    id,
    CASE
        WHEN pr <= 0.25 THEN 'CRITICAL'
        WHEN pr <= 0.50 THEN 'HIGH'
        WHEN pr <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END colony_name
FROM
    e
ORDER BY
    1;
