SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO i
    JOIN FISH_NAME_INFO n on i.FISH_TYPE = n.FISH_TYPE
WHERE FISH_NAME IN ('BASS', 'SNAPPER')
