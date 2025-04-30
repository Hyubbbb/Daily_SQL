WITH TMP AS(
    SELECT 
        DISTINCT salary
        , DENSE_RANK() OVER (ORDER BY salary DESC) AS rn
    FROM Employee
)

SELECT t2.salary AS SecondHighestSalary
FROM (SELECT 1) t1
    LEFT JOIN (
        SELECT salary FROM TMP
        WHERE rn = 2) t2
        ON 1=1
