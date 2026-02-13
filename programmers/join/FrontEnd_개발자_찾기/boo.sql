WITH front_language AS (
    SELECT 
        s.code
    FROM skillcodes AS s
    WHERE 1=1
        AND s.category = 'front end'
)

SELECT 
    DISTINCT d.id,
    d.email,
    d.first_name, 
    d.last_name
FROM developers AS d
    JOIN front_language AS fl
        ON d.skill_code & fl.code
ORDER BY d.id;
