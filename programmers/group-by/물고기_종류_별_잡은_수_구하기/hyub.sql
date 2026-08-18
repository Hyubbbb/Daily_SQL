SELECT
    COUNT(*) AS fish_count,
    fno.fish_name
FROM fish_info AS fi
    JOIN fish_name_info AS fno
        ON fi.fish_type = fno.fish_type
GROUP BY fno.fish_name
ORDER BY fish_count DESC