CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    WITH TMP AS(
        SELECT 
            DISTINCT salary
            , DENSE_RANK() OVER (ORDER BY salary DESC) AS RN
        FROM Employee    
    )

    SELECT salary
    FROM (SELECT 1) t1
    LEFT JOIN (
        SELECT salary
        FROM TMP
        WHERE RN = N
    ) t2 ON 1=1
  );
END
