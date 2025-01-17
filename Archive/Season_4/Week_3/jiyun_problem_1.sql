WITH TMP AS (
  SELECT *,
    ROW_NUMBER() OVER (ORDER BY measured_at) AS rownum,
    SUM(zone_quads) OVER (ORDER BY measured_at) AS cumsum_q,
    SUM(zone_smir) OVER (ORDER BY measured_at) AS cumsum_s,
    SUM(zone_boussafou) OVER (ORDER BY measured_at) AS cumsum_b
  FROM power_consumptions
  WHERE measured_at BETWEEN '2017-01-01T00:00:00' AND '2017-02-01T00:00:00'
),

TMP2 AS (
  SELECT *,
    LAG(cumsum_q, 6) OVER (ORDER BY rownum) AS cumsum_q_bf,
    LAG(cumsum_s, 6) OVER (ORDER BY rownum) AS cumsum_s_bf,
    LAG(cumsum_b, 6) OVER (ORDER BY rownum) AS cumsum_b_bf
  FROM TMP
)

SELECT
  DATETIME(measured_at, '+10 minutes') AS end_at,
  CASE WHEN rownum BETWEEN 1 AND 6 THEN ROUND(cumsum_q/rownum,2)
    ELSE ROUND((cumsum_q-cumsum_q_bf)/6,2)
  END AS zone_quads,

    CASE WHEN rownum BETWEEN 1 AND 6 THEN ROUND(cumsum_s/rownum,2)
    ELSE ROUND((cumsum_s-cumsum_s_bf)/6,2)
  END AS zone_smir,

    CASE WHEN rownum BETWEEN 1 AND 6 THEN ROUND(cumsum_b/rownum,2)
    ELSE ROUND((cumsum_b-cumsum_b_bf)/6,2)
  END AS zone_boussafou

FROM TMP2
