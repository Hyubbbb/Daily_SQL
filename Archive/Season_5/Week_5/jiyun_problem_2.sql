WITH TMP AS (
    SELECT
      *,
      2 * 6356000 * ASIN(
        SQRT(
          POWER(SIN((A.lat - B.lat) / 2), 2) + COS(A.lat) * COS(B.lat) * POWER(SIN((A.lng - B.lng) / 2), 2)
        )
      ) AS d
    FROM
      (
        SELECT
          station_id,
          name,
          lat * Pi() / 180 AS lat,
          lng * PI() / 180 AS lng,
          updated_at
        FROM station
      ) A
      JOIN (
        SELECT
          station_id,
          name,
          lat * Pi() / 180 AS lat,
          lng * PI() / 180 AS lng,
          updated_at
        FROM station
      ) B ON A.station_id != B.station_id
    WHERE
      d < 300
      and A.updated_at < B.updated_at
  )

SELECT station_id, name
FROM TMP
GROUP BY station_id
HAVING COUNT(station_id) >= 5
