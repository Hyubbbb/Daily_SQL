# Write your MySQL query statement below
# 걍 위아래로 합쳐버려, 가로로 합치기=UNION

# 속한 부서가 하나인 테이블
SELECT
    employee_id,
    department_id
FROM
    Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1

UNION ALL

SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = "Y"
