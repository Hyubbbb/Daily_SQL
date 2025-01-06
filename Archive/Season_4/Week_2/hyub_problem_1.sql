-- https://solvesql.com/problems/find-unnecessary-station-2/

WITH T2018_rent AS (
  SELECT 
    rent_station_id,
    COUNT(*) AS cnt_2018_rent
  FROM rental_history
  WHERE rent_at LIKE '2018-10%'
  GROUP BY rent_station_id
),
T2018_return AS (
  SELECT 
    return_station_id,
    COUNT(*) AS cnt_2018_return
  FROM rental_history
  WHERE return_at LIKE '2018-10%'
  GROUP BY return_station_id
),
T2019_rent AS (
  SELECT 
    rent_station_id,
    COUNT(*) AS cnt_2019_rent
  FROM rental_history
  WHERE rent_at LIKE '2019-10%'
  GROUP BY rent_station_id
),
T2019_return AS (
  SELECT 
    return_station_id,
    COUNT(*) AS cnt_2019_return
  FROM rental_history
  WHERE return_at LIKE '2019-10%'
  GROUP BY return_station_id
),
Aggregated AS (
  SELECT 
    COALESCE(t11.rent_station_id, t12.return_station_id, t21.rent_station_id, t22.return_station_id) AS station_id,
    COALESCE(cnt_2018_rent, 0) AS cnt_2018_rent,
    COALESCE(cnt_2018_return, 0) AS cnt_2018_return,
    COALESCE(cnt_2019_rent, 0) AS cnt_2019_rent,
    COALESCE(cnt_2019_return, 0) AS cnt_2019_return
  FROM T2018_rent t11
  FULL OUTER JOIN T2018_return t12
    ON t11.rent_station_id = t12.return_station_id
  FULL OUTER JOIN T2019_rent t21
    ON COALESCE(t11.rent_station_id, t12.return_station_id) = t21.rent_station_id
  FULL OUTER JOIN T2019_return t22
    ON COALESCE(t11.rent_station_id, t12.return_station_id) = t22.return_station_id
),
Filtered AS (
  SELECT
    station_id,
    cnt_2018_rent,
    cnt_2018_return,
    cnt_2019_rent,
    cnt_2019_return,
    ROUND(100 * (COALESCE(cnt_2019_rent, 0) + COALESCE(cnt_2019_return, 0) + 0.00) /
                  (COALESCE(cnt_2018_rent, 0) + COALESCE(cnt_2018_return, 0) + 0.00), 2) AS usage_pct
  FROM Aggregated
  WHERE (COALESCE(cnt_2018_rent, 0) + COALESCE(cnt_2018_return, 0)) > 0
    AND (COALESCE(cnt_2019_rent, 0) + COALESCE(cnt_2019_return, 0)) > 0
)
SELECT 
  f.station_id,
  s.name,
  s.local,
  f.usage_pct
FROM Filtered f
LEFT JOIN station s
  ON f.station_id = s.station_id
WHERE f.usage_pct <= 50;
