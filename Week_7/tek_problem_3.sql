/* LeetCode 1193. Monthly Transactions I
https://leetcode.com/problems/monthly-transactions-i/ */

SELECT DATE_FORMAT(t.trans_date, "%Y-%m") as month,
    t.country,
    COUNT(t.trans_date) as trans_count,
    SUM(
        CASE 
            WHEN t.state = "approved" THEN 1 
            ELSE 0 
        END
    ) as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(
        CASE 
            WHEN t.state = "approved" THEN t.state * t.amount 
            ELSE 0
        END
    ) as approved_total_amount
FROM Transactions as t
GROUP BY DATE_FORMAT(t.trans_date, "%Y-%m"), t.country