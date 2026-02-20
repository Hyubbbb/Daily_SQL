WITH fish_type_rnk AS (
    SELECT
        fi.id,
        fni.fish_name,
        fi.length,
        ROW_NUMBER() OVER(PARTITION BY fi.fish_type ORDER BY length DESC) AS rnk
    FROM fish_info AS fi
        JOIN fish_name_info AS fni
            ON fi.fish_type = fni.fish_type
)
            
SELECT
    id,
    fish_name,
    length
FROM fish_type_rnk
WHERE 1=1
    AND rnk=1
ORDER BY id;
