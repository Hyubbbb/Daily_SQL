SELECT
    id,
    PERCENT_RANK() OVER (ORDER BY size_of_colony DESC) AS pr
  FROM ecoli_data
        WHEN 1 THEN 'CRITICAL'
        WHEN 2 THEN 'HIGH'
        WHEN 3 THEN 'MEDIUM'
        WHEN 4 THEN 'LOW'
    END AS colony_name
FROM
    ecoli_data
ORDER BY
    id;
