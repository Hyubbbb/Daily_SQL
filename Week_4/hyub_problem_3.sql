-- https://solvesql.com/problems/sales-summary/

SELECT ROUND(AVG(tmp), 2) AS avg_sales
FROM (SELECT SUM(total_bill) AS tmp FROM tips GROUP BY day)
