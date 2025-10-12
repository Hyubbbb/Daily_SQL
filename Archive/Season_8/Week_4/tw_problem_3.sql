-- 문자열 다루기 오랜만이라 처음에 기억이 안난다.

SELECT
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY 1
