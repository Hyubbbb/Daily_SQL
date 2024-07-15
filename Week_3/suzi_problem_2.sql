'먼저 2세대 풀 만들어 놓은 걸 뽑아내기'


SELECT ID
FROM (
    SELECT ID, PARENT_ID
    FROM ECOLI_DATA
    
    '2세대 뽑아내기'
    WHERE PARENT_ID IN ('Null의 자식이 부모'
                        SELECT ID FROM ECOLI_DATA WHERE PARENT_ID IN (
                        'Null 부모'
                        SELECT ID FROM ECOLI_DATA WHERE PARENT_ID IS NULL))
) AS Gen2
ORDER BY 1;
