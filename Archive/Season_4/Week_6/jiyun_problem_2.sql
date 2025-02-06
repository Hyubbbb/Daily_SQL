SELECT 
  quartet,
  ROUND(AVG(x),2) AS x_mean,
  ROUND(VARIANCE(x),2) AS x_var,
  ROUND(AVG(y),2) AS y_mean,
  ROUND(VARIANCE(y),2) AS y_var
FROM points
GROUP BY quartet
