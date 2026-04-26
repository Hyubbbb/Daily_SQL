-- 언어별 개발자 분류하기
WITH frontend_skill AS (
    SELECT
        SUM(code) AS frontend_code
    FROM skillcodes
    WHERE 1 = 1
      AND category = 'Front End'
),
python_skill AS (
    SELECT
        code AS python_code
    FROM skillcodes
    WHERE 1 = 1
      AND name = 'Python'
),
csharp_skill AS (
    SELECT
        code AS csharp_code
    FROM skillcodes
    WHERE 1 = 1
      AND name = 'C#'
),
classified AS (
    SELECT
        CASE
            WHEN d.skill_code & f.frontend_code > 0
             AND d.skill_code & p.python_code > 0 THEN 'A'
            WHEN d.skill_code & c.csharp_code > 0 THEN 'B'
            WHEN d.skill_code & f.frontend_code > 0 THEN 'C'
        END AS grade,
        d.id,
        d.email
    FROM developers AS d
    CROSS JOIN frontend_skill AS f
    CROSS JOIN python_skill AS p
    CROSS JOIN csharp_skill AS c
)
SELECT
    grade,
    id,
    email
FROM classified
WHERE 1 = 1
  AND grade IS NOT NULL
ORDER BY
    grade,
    id;
