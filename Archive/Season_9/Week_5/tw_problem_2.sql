-- https://solvesql.com/problems/inspection-needed-bike/
WITH meter AS (
  SELECT 
    bike_id,
    SUM(distance) AS m_distance
  FROM rental_history
  WHERE 1=1
    AND YEAR(rent_at) = 2021
    AND MONTH(rent_at) = 01
    AND YEAR(return_at) = 2021
    AND MONTH(return_at) = 01
  GROUP BY 1
)

SELECT
  bike_id
FROM meter
WHERE m_distance >= 50000
