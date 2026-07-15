SELECT 
    COUNT(*) AS fish_count
FROM fish_info
WHERE 1=1
    AND time BETWEEN '2021-01-01' AND '2021-12-31'