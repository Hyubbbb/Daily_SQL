/* leetcode Medium 한 번 더 풀기
626. Exchange Seats
https://leetcode.com/problems/exchange-seats/description/ */


WITH CTE AS (
    SELECT
        CASE
            WHEN id % 2 = 0 THEN id - 1
            ELSE id + 1
        END as id_mod,
        student
    FROM Seat
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY id_mod) AS id,
    student
FROM CTE
ORDER BY id_mod

