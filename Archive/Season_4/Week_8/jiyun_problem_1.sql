SELECT strftime('%Y', acquisition_date) AS 'Acquisition year',
  COUNT(*) AS 'New acquisitions this year (Flow)',
  SUM(COUNT(artwork_id)) OVER (ORDER BY strftime('%Y', acquisition_date)) AS 'Total collection size (Stock)'
FROM artworks
WHERE acquisition_date IS NOT NULL
GROUP BY strftime('%Y', acquisition_date)
