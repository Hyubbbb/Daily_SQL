WITH frontendtotal AS (
    SELECT SUM(code) AS total
    FROM skillcodes
    WHERE 1=1
        AND category = 'front end'
)

SELECT
    d.id,
    d.email,
    d.first_name,
    d.last_name
FROM developers AS d
    JOIN frontendtotal AS f
        ON d.skill_code & f.total > 0
ORDER BY d.id;
