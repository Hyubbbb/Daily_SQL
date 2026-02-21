WITH front AS (
    SELECT
        d.id,
        d.email,
        d.first_name,
        d.last_name
    FROM developers AS d
      JOIN skillcodes AS s
        ON s.category = 'Front End'
          AND (d.skill_code & s.code) = s.code
)
SELECT
    id,
    email,
    first_name,
    last_name
FROM front
GROUP BY
    id, email, first_name, last_name
ORDER BY id ASC;
