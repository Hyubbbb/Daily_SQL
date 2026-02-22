WITH max_fish AS (
    SELECT
        fish_type,
        MAX(length) AS length
    FROM fish_info
    GROUP BY fish_type 
)

SELECT
    fi.id,
    fni.fish_name,
    fi.length
FROM fish_info AS fi
    JOIN max_fish AS mf
        ON fi.fish_type = mf.fish_type
            AND fi.length = mf.length
    JOIN fish_name_info AS fni
        ON fi.fish_type = fni.fish_type
ORDER BY fi.id
