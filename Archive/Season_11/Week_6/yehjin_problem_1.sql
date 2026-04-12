SELECT
    COUNT(fi.fish_type) AS fish_count,
    fni.fish_name
FROM fish_info AS fi
    JOIN fish_name_info AS fni
        ON fi.fish_type=fni.fish_type
GROUP BY fni.fish_name
ORDER BY fish_count DESC;