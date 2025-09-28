# Write your MySQL query statement below
# 가장 긴 변의 길이가 나머지 두 변의 길이의 합보다 작아야 한다
SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z AND x + z > y AND z + y > x THEN 'Yes'
        ELSE 'No'
        END AS 'triangle'
FROM Triangle
