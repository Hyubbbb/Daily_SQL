SELECT COUNT(*) AS fish_count
FROM fish_info AS f
    JOIN fish_name_info AS n
        ON f.fish_type = n.fish_type
WHERE 1=1
    AND n.fish_name IN ('bass', 'snapper')