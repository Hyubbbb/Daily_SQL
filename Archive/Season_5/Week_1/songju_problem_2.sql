--https://solvesql.com/problems/group-by/

SELECT 
    quartet,
    ROUND(AVG(x), 2) AS x_mean,
    ROUND(VAR_SAMP(x), 2) AS x_var,
    ROUND(AVG(y), 2) AS y_mean,
    ROUND(VAR_SAMP(y), 2) AS y_var
FROM points
GROUP BY quartet;
