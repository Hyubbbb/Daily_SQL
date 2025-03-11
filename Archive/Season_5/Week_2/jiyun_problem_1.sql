SELECT day, MAX(tip_daily) AS tip_daily
FROM (
  SELECT day,SUM(tip) AS tip_daily
  FROM tips
  GROUP BY day
)
