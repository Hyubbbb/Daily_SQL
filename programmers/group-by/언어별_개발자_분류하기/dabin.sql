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
)

SELECT
    CASE
        WHEN developers.skill_code & frontend_skill.frontend_code > 0
         AND developers.skill_code & python_skill.python_code > 0 THEN 'A'
        WHEN developers.skill_code & csharp_skill.csharp_code > 0 THEN 'B'
        WHEN developers.skill_code & frontend_skill.frontend_code > 0 THEN 'C'
    END AS grade,
    developers.id,
    developers.email
FROM developers
CROSS JOIN frontend_skill
CROSS JOIN python_skill
CROSS JOIN csharp_skill
WHERE 1 = 1
  AND (
        developers.skill_code & frontend_skill.frontend_code > 0
     OR developers.skill_code & python_skill.python_code > 0
     OR developers.skill_code & csharp_skill.csharp_code > 0
  )
  AND CASE
          WHEN developers.skill_code & frontend_skill.frontend_code > 0
           AND developers.skill_code & python_skill.python_code > 0 THEN 'A'
          WHEN developers.skill_code & csharp_skill.csharp_code > 0 THEN 'B'
          WHEN developers.skill_code & frontend_skill.frontend_code > 0 THEN 'C'
      END IS NOT NULL
ORDER BY
    grade,
    developers.id;
