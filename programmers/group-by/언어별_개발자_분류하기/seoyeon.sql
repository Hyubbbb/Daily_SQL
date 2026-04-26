WITH frontend_skill AS (
  SELECT
    SUM(sc.code) AS frontend_code
  FROM skillcodes AS sc
  WHERE 1=1
    AND sc.category = 'Front End'
),
python_skill AS (
  SELECT
    sc.code AS python_code
  FROM skillcodes AS sc
  WHERE 1=1
    AND sc.name = 'Python'
),
csharp_skill AS (
  SELECT
    sc.code AS csharp_code
  FROM skillcodes AS sc
  WHERE 1=1
    AND sc.name = 'C#'
),
developer_grade AS (
  SELECT
    CASE
      WHEN (d.skill_code & fs.frontend_code) > 0
        AND (d.skill_code & ps.python_code) > 0 THEN 'A'
      WHEN (d.skill_code & cs.csharp_code) > 0 THEN 'B'
      WHEN (d.skill_code & fs.frontend_code) > 0 THEN 'C'
    END AS grade,
    d.id AS id,
    d.email AS email
  FROM developers AS d
    CROSS JOIN frontend_skill AS fs
    CROSS JOIN python_skill AS ps
    CROSS JOIN csharp_skill AS cs
)

SELECT
  dg.grade AS grade,
  dg.id AS id,
  dg.email AS email
FROM developer_grade AS dg
WHERE 1=1
  AND dg.grade IS NOT NULL
ORDER BY grade, id;
