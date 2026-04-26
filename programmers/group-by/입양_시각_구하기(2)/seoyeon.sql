WITH RECURSIVE hour_list AS (
  SELECT
    0 AS hour
  UNION ALL
  SELECT
    hl.hour + 1 AS hour
  FROM hour_list AS hl
  WHERE hl.hour < 23
),
adoption_by_hour AS (
  SELECT
    HOUR(ao.datetime) AS hour,
    COUNT(*) AS count
  FROM animal_outs AS ao
  GROUP BY hour
)

SELECT
  hl.hour AS hour,
  IFNULL(abh.count, 0) AS count
FROM hour_list AS hl
  LEFT JOIN adoption_by_hour AS abh
    ON hl.hour = abh.hour
ORDER BY hour;
