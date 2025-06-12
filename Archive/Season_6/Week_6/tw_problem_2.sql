-- 조회 조건에는 이름보다는 확실한 구분키인 id로!
SELECT name
FROM Customer
WHERE id not in (SELECT id
                    FROM Customer
                    WHERE referee_id = 2) 
