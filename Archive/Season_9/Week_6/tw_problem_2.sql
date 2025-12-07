SELECT measured_at AS 'good_day'
FROM measurements
WHERE 1=1
  AND pm2_5 <= 9
  AND MONTH(measured_at) = 12
ORDER BY 1
