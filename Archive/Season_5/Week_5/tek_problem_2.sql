/* leetcode Medium 한 번 더 풀기
1907. Count Salary Categories
https://leetcode.com/problems/count-salary-categories/description/ */

WITH CTE AS (
    SELECT *
    FROM (
        SELECT 
            account_id,
            income,
            CASE
                WHEN income > 50000 THEN 'High Salary'
                WHEN income < 20000 THEN 'Low Salary'
                ELSE 'Average Salary'
            END AS category
        FROM Accounts
    )
),
CATEGORY_LIST AS (
    SELECT UNNEST(ARRAY['High Salary', 'Low Salary', 'Average Salary']) as cat_list
)

SELECT cl.cat_list as category, COALESCE(COUNT(category), 0) as accounts_count
FROM CATEGORY_LIST AS cl
LEFT JOIN CTE AS c
    ON cl.cat_list = c.category
GROUP BY cl.cat_list