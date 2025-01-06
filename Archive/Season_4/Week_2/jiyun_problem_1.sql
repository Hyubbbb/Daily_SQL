SELECT DISTINCT art.classification, 
  CASE WHEN four_c IS NULL THEN 0
        ELSE four_c
        END AS '2014', 
    CASE WHEN five_c IS NULL THEN 0
        ELSE five_c
        END AS '2015',
      CASE WHEN six_c IS NULL THEN 0
        ELSE six_c
        END AS '2016'
FROM artworks art
LEFT JOIN (
  SELECT classification, COUNT(*) AS four_c
            FROM artworks
            WHERE SUBSTR(acquisition_date,1,4)='2014'
            GROUP BY classification
            ) AS four
  ON art.classification=four.classification
LEFT JOIN (
SELECT classification, COUNT(*) AS five_c
            FROM artworks
            WHERE SUBSTR(acquisition_date,1,4)='2015'
            GROUP BY classification
) AS five
  ON art.classification=five.classification
LEFT JOIN (SELECT classification, COUNT(*) AS six_c
            FROM artworks
            WHERE SUBSTR(acquisition_date,1,4)='2016'
            GROUP BY classification) AS six
  ON art.classification=six.classification

ORDER BY art.classification
