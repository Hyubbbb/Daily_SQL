SELECT DISTINCT
  rec.region AS Region,
  Furniture,
  Office AS 'Office Supplies',
  Technology

FROM records rec

  JOIN (
    SELECT 
      region,
      COUNT(DISTINCT Order_id) AS Furniture
    FROM records
    WHERE category = 'Furniture'
    GROUP BY region
  ) AS fur ON rec.region = fur.region

  JOIN (
    SELECT 
      region,
      COUNT(DISTINCT Order_id) AS Office
    FROM records
    WHERE category = 'Office Supplies'
    GROUP BY region
  ) sup ON rec.region = sup.region

  JOIN (
    SELECT
      region,
      COUNT(DISTINCT Order_id) AS Technology
    FROM records
    WHERE category = 'Technology'
    GROUP BY Region
  ) tech ON rec.region = tech.region

ORDER BY rec.region
