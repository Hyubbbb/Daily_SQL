-- 코드를 작성해주세요
SELECT COUNT(*) FISH_COUNT
FROM FISH_INFO F LEFT JOIN FISH_NAME_INFO N
    ON F.FISH_TYPE = N.FISH_TYPE
WHERE FISH_NAME IN ("BASS", "SNAPPER")