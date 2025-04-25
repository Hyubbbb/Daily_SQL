/*
leetcode  Medium 한 번 더 풀기
3220. Odd and Even Transactions
https://leetcode.com/problems/odd-and-even-transactions/description/
*/

SELECT transaction_date,
    COALESCE(SUM(amount) FILTER (WHERE amount % 2 = 1), 0) as odd_sum,
    COALESCE(SUM(amount) FILTER (WHERE amount % 2 = 0), 0) as even_sum    
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date