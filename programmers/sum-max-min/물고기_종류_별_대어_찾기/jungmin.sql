WITH max_length AS (
    SELECT
        fi.fish_type,
        MAX(fi.length) AS max_length
    FROM fish_info AS fi
        JOIN fish_name_info AS fn
            ON fi.fish_type = fn.fish_type
    GROUP BY fn.fish_type
)

SELECT
    fi.id,
    fn.fish_name,
    fi.length
FROM fish_info AS fi
    JOIN fish_name_info AS fn
        ON fi.fish_type = fn.fish_type
    JOIN max_length AS ml
        ON fi.fish_type = ml.fish_type
WHERE 1=1
    AND fi.length = ml.max_length
ORDER BY fi.id;
