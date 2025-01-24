WITH Earnings AS (
    SELECT employee_id, name, (months * salary) AS total_earnings
    FROM Employee)

SELECT MAX(total_earnings) AS max_total_earnings, COUNT(*) AS employee_count
FROM Employee e JOIN Earnings n ON e.employee_id=n.employee_id
WHERE total_earnings = (SELECT MAX(total_earnings) FROM Earnings) -- 서브쿼리로 MAX값 따로 조회
