-- 윈도우 함수를 열심히 배운 보람이 느껴진 문제
-- LAG, LEAD 탐색 함수로 한 큐에 해결

SELECT
    id,
    CASE
        WHEN id%2 = 1 THEN IFNULL(LEAD(student) OVER (ORDER BY id), student)
        ELSE IFNULL(LAG(student) OVER (ORDER BY id), student) END AS student
FROM seat
